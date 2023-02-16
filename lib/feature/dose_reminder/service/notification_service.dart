import 'package:apkainzynierka/feature/dose_reminder/service/dose_reminder_action_handler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const actionSnoozeId = "action_snooze";
const actionTakeDoseId = "action_take_dose";

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
                channelDescription: channelDescription, actions: [
                  const AndroidNotificationAction(actionSnoozeId, "Przypomnij później"),
                  const AndroidNotificationAction(actionTakeDoseId, "Przyjęto dawkę", showsUserInterface: true),
                ])));
  }

  Future<void> initialize() async {
    await _plugin.initialize(
      const InitializationSettings(
          android: AndroidInitializationSettings('ic_launcher')),
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
      onDidReceiveNotificationResponse: notificationTapBackground,
    );
  }
}
