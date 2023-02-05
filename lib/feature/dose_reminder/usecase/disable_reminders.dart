import 'package:apkainzynierka/feature/dose_reminder/service/dose_reminder_scheduler.dart';

class DisableReminders {
  final DoseReminderScheduler _doseReminderScheduler;

  DisableReminders(this._doseReminderScheduler);

  void call() {
    _doseReminderScheduler.cancel();
  }
}
