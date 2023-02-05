import 'package:apkainzynierka/feature/dose_reminder/model/notification_settings.dart';
import 'package:flutter/material.dart';

class NotificationSetupView extends StatelessWidget {
  final void Function(int hour, int minute) onEnabled;
  final void Function() onDisabled;
  final NotificationSettings model;

  const NotificationSetupView(
      {super.key,
      required this.model,
      required this.onEnabled,
      required this.onDisabled});

  String get paddedMinutes => "${model.minute}".padLeft(2, "0");

  String get paddedHours => "${model.hour}".padLeft(2, "0");

  TimeOfDay get initialTime =>
      TimeOfDay(hour: model.hour, minute: model.minute);

  void onChanged(BuildContext context, bool enabled) {
    if (model.enabled) {
      onDisabled();
      return;
    }

    showTimePicker(context: context, initialTime: initialTime).then((value) {
      if (value != null) {
        onEnabled(value.hour, value.minute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text("Codzienne powiadomienia"),
      subtitle: model.enabled
          ? Text("Powiadomienie wyświetla się o $paddedHours:$paddedMinutes.")
          : const Text("Powiadomienia nie wyświetlają się."),
      value: model.enabled,
      onChanged: (enabled) => onChanged(context, enabled),
    );
  }
}
