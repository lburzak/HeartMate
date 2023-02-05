import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_settings.freezed.dart';

@freezed
class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings(
      {required bool enabled,
      required int hour,
      required int minute}) = _NotificationSettings;
}
