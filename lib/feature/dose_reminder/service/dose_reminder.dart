import 'package:apkainzynierka/data/database.dart';
import 'package:apkainzynierka/data/local_schedule_repository.dart';
import 'package:apkainzynierka/domain/repository/schedule_repository.dart';
import 'package:apkainzynierka/domain/usecase/get_today_dosage.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/notification_service.dart';
import 'package:apkainzynierka/main.dart';
import 'package:kiwi/kiwi.dart';

const _reminderNotificationChannelName = "Przyjmij dawkę";
const _reminderNotificationChannelDescription =
    "Wyświetla przypomnienie codziennie o godzinie określonej w ustawieniach aplikacji.";

class DoseReminder {
  final NotificationService _notificationService;
  final GetTodayDosage _getTodayDosage;

  DoseReminder(this._notificationService, this._getTodayDosage);

  void trigger() async {
    final dosage = _getTodayDosage();

    if (dosage == null || dosage == 0) {
      return;
    }

    _notificationService.show(
        title: "Przyjmij dzisiejszą dawkę!",
        body: "Zaplanowana dawka: $dosage mg",
        channelName: _reminderNotificationChannelName,
        channelDescription: _reminderNotificationChannelDescription);
  }
}

class DoseReminderModule extends KiwiContainer {
  DoseReminderModule(AppContainer appContainer) : super.scoped() {
    registerFactory((r) => DoseReminder(r.resolve(), r.resolve()));
    registerInstance(appContainer.resolve<NotificationService>());
    registerFactory((r) => GetTodayDosage(r.resolve()));
    registerFactory<ScheduleRepository>(
        (r) => LocalScheduleRepository(r.resolve()));
    registerInstance(appContainer.resolve<BoxDatabase>());
  }
}
