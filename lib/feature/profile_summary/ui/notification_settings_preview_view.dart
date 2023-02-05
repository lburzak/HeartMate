import 'package:apkainzynierka/feature/dose_reminder/model/notification_settings.dart';
import 'package:apkainzynierka/util/time_extensions.dart';
import 'package:flutter/material.dart';

class NotificationSettingsPreviewView extends StatelessWidget {
  final NotificationSettings model;

  const NotificationSettingsPreviewView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(width: 30),
      Text('Powiadomienia'),
      SizedBox(width: 100),
      Text(model.enabled ? formatTime(model.hour, model.minute) : "wyłączone")
    ]);
  }

}