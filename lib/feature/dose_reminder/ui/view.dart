import 'package:apkainzynierka/feature/dose_reminder/model/notification_settings.dart';
import 'package:flutter/material.dart';

class NotificationSetupView extends StatelessWidget {
  final void Function(bool enabled) onSwitched;
  final void Function(int hour, int minute) onTimeChanged;
  final NotificationSettings model;

  const NotificationSetupView(
      {super.key,
      required this.model,
      required this.onSwitched,
      required this.onTimeChanged});

  String get paddedMinutes => "${model.minute}".padLeft(2, "0");

  String get paddedHours => "${model.hour}".padLeft(2, "0");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SwitchListTile(
        title: const Text("Codzienne powiadomienia"),
        subtitle: model.enabled
            ? Text("Powiadomienie wyświetla się o $paddedHours:$paddedMinutes.")
            : const Text("Powiadomienia nie wyświetlają się."),
        value: model.enabled,
        onChanged: (value) {
          if (model.enabled) {
            onSwitched(false);
            return;
          }

          showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay(hour: model.hour, minute: model.minute))
              .then((value) {
            if (value != null) {
              onTimeChanged(value.hour, value.minute);
            }
          });
        },
      ),
    );
  }
}
