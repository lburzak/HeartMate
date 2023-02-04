import 'package:apkainzynierka/feature/dose_reminder/service/local_date_time_factory.dart';
import 'package:apkainzynierka/system/startup_event.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const _reminderNotificationId = 555;
const _reminderNotificationChannelId = "heartmate_reminder";
const _reminderNotificationChannelName = "Przyjmij dawkę";
const _reminderNotificationChannelDescription =
    "Wyświetla przypomnienie codziennie o godzinie określonej w ustawieniach aplikacji.";

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
        "Przyjmij dawkę",
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
        AndroidNotificationDetails(
            _reminderNotificationChannelId, _reminderNotificationChannelName,
            channelDescription: _reminderNotificationChannelDescription,
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
