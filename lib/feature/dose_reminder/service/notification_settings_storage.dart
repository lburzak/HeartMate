import 'package:apkainzynierka/feature/dose_reminder/model/notification_settings.dart';

abstract class NotificationSettingsStorage {
  NotificationSettings get();

  void update({bool? enabled, int? hour, int? minute});
}
