import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/local_dose_repository.dart';
import 'package:apkainzynierka/data/local_schedule_repository.dart';
import 'package:apkainzynierka/domain/repository/dose_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/domain/usecase/report_dose_taken.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/dose_reminder_scheduler.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/notification_service.dart';
import 'package:apkainzynierka/main.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kiwi/kiwi.dart';
import 'package:workmanager/workmanager.dart';

const _snoozeDuration = Duration(minutes: 15);

class DoseReminderActionHandler {
  final DoseReminderScheduler _scheduler;
  final ReportDoseTaken _reportDoseTaken;

  DoseReminderActionHandler(this._scheduler, this._reportDoseTaken);

  void onSnooze() {
    _scheduler.scheduleIn(_snoozeDuration);
  }

  void onTakeDose() {
    _reportDoseTaken.standard();
  }
}

class DoseReminderActionModule extends KiwiContainer {
  DoseReminderActionModule(AppContainer appContainer) : super.scoped() {
    registerFactory((i) => DoseReminderActionHandler(i(), i()));
    registerFactory((i) => DoseReminderScheduler(i()));
    registerFactory((i) => ReportDoseTaken(i(), i(), i()));
    registerFactory<ScheduleRepository>((i) => LocalScheduleRepository(i()));
    registerFactory<DoseRepository>((i) => LocalDoseRepository(i()));
    registerInstance(appContainer.resolve<BoxDatabase>());
    registerInstance(appContainer.resolve<EventBus>());
    registerInstance(appContainer.resolve<Workmanager>());
  }
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) async {
  try {
    final appContainer = AppContainer();
    await appContainer.resolve<BoxDatabase>().initialize();
    final doseReminderModule = DoseReminderActionModule(appContainer);
    final doseReminder = doseReminderModule.resolve<DoseReminderActionHandler>();

    switch (notificationResponse.actionId) {
      case actionSnoozeId:
        doseReminder.onSnooze();
        break;
      case actionTakeDoseId:
        doseReminder.onTakeDose();
        break;
    }
  } catch (err) {
    throw Exception(err);
  }
}
