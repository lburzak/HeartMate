import 'package:apkainzynierka/feature/dose_reminder/model/notification_settings.dart';
import 'package:apkainzynierka/feature/dose_reminder/service/notification_settings_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationSettingsPreviewCubit extends Cubit<NotificationSettings> {
  final NotificationSettingsStorage _notificationSettingsStorage;

  NotificationSettingsPreviewCubit(this._notificationSettingsStorage)
      : super(const NotificationSettings(enabled: false, hour: 0, minute: 0)) {
    _pullData();
  }

  void _pullData() {
    final settings = _notificationSettingsStorage.get();
    emit(settings);
  }
}
