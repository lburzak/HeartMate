import 'package:apkainzynierka/feature/dose_reminder/model/notification_settings.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/cubit.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/dose_reminder_scheduler.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/local_date_time_factory.dart';
import 'package:apkainzynierka/feature/dose_reminder/ui/view.dart';
import 'package:apkainzynierka/main.dart';
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
              onSwitched: (enabled) =>
                  context.read<NotificationSetupCubit>().switchEnabled(enabled),
              onTimeChanged: (hour, minute) =>
                  context.read<NotificationSetupCubit>().setTime(hour, minute),
              model: state);
        },
      ),
    );
  }
}

class DoseReminderContainer extends KiwiContainer {
  DoseReminderContainer({required AppContainer appContainer}) : super.scoped() {
    registerFactory((r) => NotificationSetupCubit(r.resolve()));
    registerFactory((r) => DoseReminderScheduler(r.resolve(), r.resolve()));
    registerInstance<LocalDateTimeFactory>(appContainer.resolve());
    registerSingleton((r) => FlutterLocalNotificationsPlugin());
  }
}
