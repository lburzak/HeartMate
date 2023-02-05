import 'package:apkainzynierka/domain/event/notification_settings_updated_event.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/dose_reminder_scheduler.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/notification_settings_storage.dart';
import 'package:event_bus/event_bus.dart';

class EnableReminders {
  final DoseReminderScheduler _doseReminderScheduler;
  final NotificationSettingsStorage _notificationSettingsStorage;
  final EventBus _eventBus;

  EnableReminders(this._doseReminderScheduler,
      this._notificationSettingsStorage, this._eventBus);

  void call(int hour, int minute) {
    _doseReminderScheduler.schedule(hour, minute);
    _notificationSettingsStorage.update(
        enabled: true, hour: hour, minute: minute);
    _eventBus.fire(NotificationSettingsUpdatedEvent());
  }
}
