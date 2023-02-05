import 'package:apkainzynierka/feature/dose_reminder/model/notification_settings.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/notification_settings_storage.dart';
import 'package:hive/hive.dart';

class LocalNotificationSettingsStorage extends NotificationSettingsStorage {
  final Box<int> _box;

  LocalNotificationSettingsStorage(this._box);

  @override
  NotificationSettings get() {
    return NotificationSettings(
        enabled: (_box.get("enabled") ?? 0) > 0,
        hour: _box.get("hour") ?? 0,
        minute: _box.get("minute") ?? 0);
  }

  @override
  void update({bool? enabled, int? hour, int? minute}) {
    if (enabled != null) {
      _box.put("enabled", enabled ? 1 : 0);
    }

    if (hour != null) {
      _box.put("hour", hour);
    }

    if (minute != null) {
      _box.put("minute", minute);
    }
  }
}
