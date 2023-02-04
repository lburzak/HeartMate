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

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Codzienne powiadomienia"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch(value: model.enabled, onChanged: onSwitched),
          TimeField(
              onChanged: onTimeChanged,
              enabled: model.enabled,
              hour: model.hour,
              minute: model.minute)
        ],
      ),
    );
  }
}

class TimeField extends StatelessWidget {
  final void Function(int hour, int minute) onChanged;
  final int hour;
  final int minute;
  final String? error;
  final bool enabled;

  String get paddedMinutes => "$minute".padLeft(2, "0");

  String get paddedHours => "$hour".padLeft(2, "0");

  const TimeField(
      {super.key,
      required this.onChanged,
      this.error,
      required this.hour,
      required this.minute,
      required this.enabled});

  @override
  Widget build(BuildContext context) {
    return FormField<int>(
        builder: (field) => GestureDetector(
              onTap: enabled
                  ? () {
                      showTimePicker(
                              context: context,
                              initialTime:
                                  TimeOfDay(hour: hour, minute: minute))
                          .then((value) => onChanged(
                              value?.hour ?? hour, value?.minute ?? minute));
                    }
                  : null,
              child: Text("$paddedHours:$paddedMinutes"),
            ));
  }
}
