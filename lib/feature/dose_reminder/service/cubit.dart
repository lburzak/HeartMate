import 'package:apkainzynierka/feature/dose_reminder/model/notification_settings.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/notification_permission_prompt.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/notification_settings_storage.dart';
import 'package:apkainzynierka/feature/dose_reminder/usecase/disable_reminders.dart';
import 'package:apkainzynierka/feature/dose_reminder/usecase/enable_reminders.dart';
import 'package:bloc/bloc.dart';

const _initialState = NotificationSettings(enabled: false, hour: 0, minute: 0);

class NotificationSetupCubit extends Cubit<NotificationSettings> {
  final EnableReminders _enableReminders;
  final DisableReminders _disableReminders;
  final NotificationPermissionPrompt _permissionPrompt;
  final NotificationSettingsStorage _notificationSettingsStorage;

  NotificationSetupCubit(this._enableReminders, this._disableReminders,
      this._notificationSettingsStorage, this._permissionPrompt)
      : super(_initialState) {
    _pullState();
  }

  void enable(int hour, int minute) {
    _permissionPrompt.requestPermissions().then((accepted) {
      if (!accepted) {
        return;
      }

      _enableReminders(hour, minute);
      emit(state.copyWith(enabled: true, hour: hour, minute: minute));
    });
  }

  void disable() {
    _disableReminders();
    emit(state.copyWith(enabled: false));
  }

  void _pullState() {
    final settings = _notificationSettingsStorage.get();
    emit(settings);
  }
}
