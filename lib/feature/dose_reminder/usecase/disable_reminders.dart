import 'package:apkainzynierka/feature/dose_reminder/service/dose_reminder_scheduler.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/notification_settings_storage.dart';

class DisableReminders {
  final DoseReminderScheduler _doseReminderScheduler;
  final NotificationSettingsStorage _notificationSettingsStorage;

  DisableReminders(
      this._doseReminderScheduler, this._notificationSettingsStorage);

  void call() {
    _doseReminderScheduler.cancel();
    _notificationSettingsStorage.update(enabled: false);
  }
}
