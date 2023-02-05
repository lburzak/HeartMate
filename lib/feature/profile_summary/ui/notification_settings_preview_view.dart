import 'package:apkainzynierka/feature/dose_reminder/model/notification_settings.dart';
import 'package:apkainzynierka/util/time_extensions.dart';
import 'package:apkainzynierka/widget/summary_row.dart';
import 'package:flutter/material.dart';

class NotificationSettingsPreviewView extends StatelessWidget {
  final NotificationSettings model;

  const NotificationSettingsPreviewView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SummaryRow(
        label: "Powiadomienia",
        value:
            model.enabled ? formatTime(model.hour, model.minute) : "wyłączone");
  }
}
