import 'package:apkainzynierka/feature/dose_reminder/service/notification_service.dart';
import 'package:apkainzynierka/main.dart';
import 'package:kiwi/kiwi.dart';

const _reminderNotificationChannelName = "Przyjmij dawkę";
const _reminderNotificationChannelDescription =
    "Wyświetla przypomnienie codziennie o godzinie określonej w ustawieniach aplikacji.";

class DoseReminder {
  final NotificationService _notificationService;

  DoseReminder(this._notificationService);

  void trigger() async {
    _notificationService.show(
        title: "Przyjmij dzisiejszą dawkę!",
        body: "Zaplanowana dawka: 5 mg",
        channelName: _reminderNotificationChannelName,
        channelDescription: _reminderNotificationChannelDescription);
  }
}

class DoseReminderModule extends KiwiContainer {
  DoseReminderModule(AppContainer appContainer) : super.scoped() {
    registerFactory((r) => DoseReminder(r.resolve()));
    registerInstance(appContainer.resolve<NotificationService>());
  }
}
