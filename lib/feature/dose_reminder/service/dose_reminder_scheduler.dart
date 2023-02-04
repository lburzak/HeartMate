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
      await BoxDatabase.init();
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
    _workManager.registerPeriodicTask("thisisveryrandom2", "notify2",
        frequency: const Duration(days: 1));
  }

  void cancel() {
    _workManager.cancelAll();
  }

  Future<void> initialize() {
    return _workManager.initialize(callbackDispatcher);
  }
}
