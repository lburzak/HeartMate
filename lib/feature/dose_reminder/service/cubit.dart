import 'package:apkainzynierka/feature/dose_reminder/model/notification_settings.dart';
import 'package:apkainzynierka/feature/dose_reminder/usecase/disable_reminders.dart';
import 'package:apkainzynierka/feature/dose_reminder/usecase/enable_reminders.dart';
import 'package:bloc/bloc.dart';

const _initialState = NotificationSettings(enabled: false, hour: 0, minute: 0);

class NotificationSetupCubit extends Cubit<NotificationSettings> {
  final EnableReminders _enableReminders;
  final DisableReminders _disableReminders;

  NotificationSetupCubit(this._enableReminders, this._disableReminders)
      : super(_initialState);

  void enable(int hour, int minute) {
    _enableReminders(hour, minute);
    emit(state.copyWith(enabled: true, hour: hour, minute: minute));
  }

  void disable() {
    _disableReminders();
    emit(state.copyWith(enabled: false));
  }
}
