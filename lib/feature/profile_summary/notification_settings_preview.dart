import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/local_notification_settings_storage.dart';
import 'package:apkainzynierka/feature/dose_reminder/model/notification_settings.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/notification_settings_storage.dart';
import 'package:apkainzynierka/feature/profile_summary/service/notification_settings_preview_cubit.dart';
import 'package:apkainzynierka/feature/profile_summary/ui/notification_settings_preview_view.dart';
import 'package:apkainzynierka/main.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class NotificationSettingsPreview extends StatelessWidget {
  const NotificationSettingsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final module = NotificationSettingsModule(context.read());

    return BlocProvider<NotificationSettingsPreviewCubit>.value(
      value: module.resolve(),
      child:
          BlocBuilder<NotificationSettingsPreviewCubit, NotificationSettings>(
        builder: (context, state) =>
            NotificationSettingsPreviewView(model: state),
      ),
    );
  }
}

class NotificationSettingsModule extends KiwiContainer {
  NotificationSettingsModule(AppContainer appContainer) : super.scoped() {
    registerFactory(
        (r) => NotificationSettingsPreviewCubit(r.resolve(), r.resolve()));
    registerFactory<NotificationSettingsStorage>((r) =>
        LocalNotificationSettingsStorage(
            appContainer.resolve<BoxDatabase>().notificationSettingsBox));
    registerInstance(appContainer.resolve<EventBus>());
  }
}
