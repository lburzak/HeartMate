abstract class NotificationsMode {
  const NotificationsMode();

  static NotificationsModeEnabled enabled({int hour = 8, int minute = 0}) =>
      NotificationsModeEnabled(hour: hour, minute: minute);

  static NotificationsModeDisabled disabled() =>
      const NotificationsModeDisabled();
}

class NotificationsModeDisabled extends NotificationsMode {
  const NotificationsModeDisabled();
}

class NotificationsModeEnabled extends NotificationsMode {
  final int hour;
  final int minute;

  const NotificationsModeEnabled({
    required this.hour,
    required this.minute,
  });
}
