import 'package:apkainzynierka/feature/dose_reminder/model/notification_settings.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/dose_reminder_scheduler.dart';
import 'package:bloc/bloc.dart';

const _initialState = NotificationSettings(enabled: false, hour: 0, minute: 0);

class NotificationSetupCubit extends Cubit<NotificationSettings> {
  final DoseReminderScheduler _doseReminderScheduler;

  NotificationSetupCubit(this._doseReminderScheduler) : super(_initialState);

  void switchEnabled(bool enabled) {
    if (enabled) {
      _doseReminderScheduler.schedule(state.hour, state.minute);
    } else {
      _doseReminderScheduler.cancel();
    }

    emit(state.copyWith(enabled: enabled));
  }

  void setTime(int hour, int minute) {
    _doseReminderScheduler.schedule(hour, minute);
    emit(state.copyWith(enabled: true, hour: hour, minute: minute));
  }
}
