import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationPermissionPrompt {
  final FlutterLocalNotificationsPlugin _plugin;

  NotificationPermissionPrompt(this._plugin);

  Future<bool> requestPermissions() async {
    final platform = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    if (platform == null) {
      return false;
    }

    final result = await platform.requestPermission();

    return result ?? false;
  }
}
