import 'package:apkainzynierka/feature/dose_reminder/service/dose_reminder.dart';
import 'package:apkainzynierka/main.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final appContainer = AppContainer();
    final doseReminderModule = DoseReminderModule(appContainer);
    final doseReminder = doseReminderModule.resolve<DoseReminder>();
    doseReminder.trigger();
    return true;
  });
}

class DoseReminderScheduler {
  final Workmanager _workManager;

  const DoseReminderScheduler(this._workManager);

  void schedule(int hour, int minute) {
    _workManager.registerPeriodicTask("thisisveryrandom2", "notify2",
        frequency: const Duration(seconds: 10));
  }

  void cancel() {
    _workManager.cancelAll();
  }

  Future<void> initialize() {
    return _workManager.initialize(callbackDispatcher);
  }
}
