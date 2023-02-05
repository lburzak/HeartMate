import 'package:apkainzynierka/feature/dose_reminder/service/dose_reminder_scheduler.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/notification_settings_storage.dart';

class EnableReminders {
  final DoseReminderScheduler _doseReminderScheduler;
  final NotificationSettingsStorage _notificationSettingsStorage;

  EnableReminders(
      this._doseReminderScheduler, this._notificationSettingsStorage);

  void call(int hour, int minute) {
    _doseReminderScheduler.schedule(hour, minute);
    _notificationSettingsStorage.update(
        enabled: true, hour: hour, minute: minute);
  }
}
