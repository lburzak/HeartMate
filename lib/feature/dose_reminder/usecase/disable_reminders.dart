import 'package:apkainzynierka/domain/event/notification_settings_updated_event.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/dose_reminder_scheduler.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/notification_settings_storage.dart';
import 'package:event_bus/event_bus.dart';

class DisableReminders {
  final DoseReminderScheduler _doseReminderScheduler;
  final NotificationSettingsStorage _notificationSettingsStorage;
  final EventBus _eventBus;

  DisableReminders(this._doseReminderScheduler,
      this._notificationSettingsStorage, this._eventBus);

  void call() {
    _doseReminderScheduler.cancel();
    _notificationSettingsStorage.update(enabled: false);
    _eventBus.fire(NotificationSettingsUpdatedEvent());
  }
}
