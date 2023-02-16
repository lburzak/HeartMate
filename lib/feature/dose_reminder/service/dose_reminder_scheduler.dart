import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/dose_reminder.dart';
import 'package:apkainzynierka/main.dart';
import 'package:logger/logger.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      final appContainer = AppContainer();
      await appContainer.resolve<BoxDatabase>().initialize();
      final doseReminderModule = DoseReminderModule(appContainer);
      final doseReminder = doseReminderModule.resolve<DoseReminder>();
      doseReminder.trigger();
    } catch (err) {
      Logger().e(err.toString());
      throw Exception(err);
    }

    return true;
  });
}

class DoseReminderScheduler {
  final Workmanager _workManager;

  const DoseReminderScheduler(this._workManager);

  void schedule(int hour, int minute) {
    Future.microtask(() async {
      await _workManager.cancelAll();
      final delay = _calculateDurationToNextOccurrence(hour, minute);
      await _workManager.registerPeriodicTask(
          "periodic_${DateTime.now().toIso8601String()}", "notify",
          frequency: const Duration(days: 1), initialDelay: delay);
    });
  }

  void scheduleIn(Duration duration) {
    Future.microtask(() async {
      await _workManager.cancelAll();
      await _workManager.registerOneOffTask(
          "periodic_${DateTime.now().toIso8601String()}", "notify",
          initialDelay: duration);
    });
  }

  Duration _calculateDurationToNextOccurrence(int hour, int minute) {
    final DateTime now = DateTime.now();
    final DateTime scheduledDate =
        DateTime(now.year, now.month, now.day, hour, minute, 0);
    if (scheduledDate.isBefore(now)) {
      return scheduledDate.add(const Duration(days: 1)).difference(now);
    }
    return scheduledDate.difference(now);
  }

  void cancel() {
    _workManager.cancelAll();
  }

  Future<void> initialize() {
    return _workManager.initialize(callbackDispatcher);
  }
}
