import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/local_notification_settings_storage.dart';
import 'package:apkainzynierka/feature/dose_reminder/model/notification_settings.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/cubit.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/dose_reminder_scheduler.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/notification_permission_prompt.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/notification_settings_storage.dart';
import 'package:apkainzynierka/feature/dose_reminder/ui/view.dart';
import 'package:apkainzynierka/feature/dose_reminder/usecase/disable_reminders.dart';
import 'package:apkainzynierka/feature/dose_reminder/usecase/enable_reminders.dart';
import 'package:apkainzynierka/main.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kiwi/kiwi.dart';

class DoseReminderSetupTile extends StatelessWidget {
  const DoseReminderSetupTile({super.key});

  @override
  Widget build(BuildContext context) {
    final container = DoseReminderContainer(appContainer: context.read());

    return BlocProvider<NotificationSetupCubit>(
      create: (context) => container.resolve(),
      child: BlocBuilder<NotificationSetupCubit, NotificationSettings>(
        builder: (context, state) {
          return NotificationSetupView(
              onEnabled: (int hour, int minute) =>
                  context.read<NotificationSetupCubit>().enable(hour, minute),
              onDisabled: () =>
                  context.read<NotificationSetupCubit>().disable(),
              model: state);
        },
      ),
    );
  }
}

class DoseReminderContainer extends KiwiContainer {
  DoseReminderContainer({required AppContainer appContainer}) : super.scoped() {
    registerFactory((r) => NotificationSetupCubit(
        r.resolve(), r.resolve(), r.resolve(), r.resolve()));
    registerFactory(
        (r) => EnableReminders(r.resolve(), r.resolve(), r.resolve()));
    registerFactory(
        (r) => DisableReminders(r.resolve(), r.resolve(), r.resolve()));
    registerFactory((r) => NotificationPermissionPrompt(r.resolve()));
    registerInstance<DoseReminderScheduler>(appContainer.resolve());
    registerFactory<NotificationSettingsStorage>((c) =>
        LocalNotificationSettingsStorage(
            appContainer.resolve<BoxDatabase>().notificationSettingsBox));
    registerInstance(appContainer.resolve<EventBus>());
    registerInstance(appContainer.resolve<FlutterLocalNotificationsPlugin>());
  }
}
