import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin;

  NotificationService(this._plugin);

  void show(
      {required String title,
      required String body,
      required String channelName,
      required String channelDescription}) {
    _plugin.show(
        555,
        title,
        body,
        NotificationDetails(
            android: AndroidNotificationDetails(channelName, channelName,
                channelDescription: channelDescription)));
  }

  Future<void> initialize() async {
    await _plugin.initialize(
      const InitializationSettings(
          android: AndroidInitializationSettings('ic_launcher')),
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        // ...
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  print("action");
}
