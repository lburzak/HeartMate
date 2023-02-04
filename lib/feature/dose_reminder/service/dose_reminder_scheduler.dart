import 'package:apkainzynierka/feature/dose_reminder/service/local_date_time_factory.dart';
import 'package:apkainzynierka/system/startup_event.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const int _reminderNotificationId = 555;

class DoseReminderScheduler {
  final LocalDateTimeFactory _dateTimeFactory;
  final FlutterLocalNotificationsPlugin plugin;

  DoseReminderScheduler(this._dateTimeFactory, this.plugin, EventBus eventBus) {
    eventBus.on<StartupEvent>().listen((event) {
      initialize();
    });
  }

  void schedule(int hour, int minute) {
    plugin.zonedSchedule(
        _reminderNotificationId,
        "title",
        "body",
        _dateTimeFactory.nextOccurrenceOf(hour, minute),
        _buildNotificationDetails(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  void cancel() {
    plugin.cancel(_reminderNotificationId);
  }

  Future<void> initialize() async {
    await plugin.initialize(
      const InitializationSettings(
          android: AndroidInitializationSettings('ic_launcher')),
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        // ...
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  NotificationDetails _buildNotificationDetails() {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            icon: "ic_launcher",
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    return const NotificationDetails(android: androidNotificationDetails);
  }
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  print("action");
}

void showNotification() async {}
