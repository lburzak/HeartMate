import 'package:apkainzynierka/feature/dose_reminder/service/dose_reminder_scheduler.dart';

class EnableReminders {
  final DoseReminderScheduler _doseReminderScheduler;

  EnableReminders(this._doseReminderScheduler);

  void call(int hour, int minute) {
    _doseReminderScheduler.schedule(hour, minute);
  }
}
