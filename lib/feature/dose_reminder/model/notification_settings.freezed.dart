// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationSettings {
  bool get enabled => throw _privateConstructorUsedError;
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationSettingsCopyWith<NotificationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingsCopyWith<$Res> {
  factory $NotificationSettingsCopyWith(NotificationSettings value,
          $Res Function(NotificationSettings) then) =
      _$NotificationSettingsCopyWithImpl<$Res, NotificationSettings>;
  @useResult
  $Res call({bool enabled, int hour, int minute});
}

/// @nodoc
class _$NotificationSettingsCopyWithImpl<$Res,
        $Val extends NotificationSettings>
    implements $NotificationSettingsCopyWith<$Res> {
  _$NotificationSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? hour = null,
    Object? minute = null,
  }) {
    return _then(_value.copyWith(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationSettingsCopyWith<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  factory _$$_NotificationSettingsCopyWith(_$_NotificationSettings value,
          $Res Function(_$_NotificationSettings) then) =
      __$$_NotificationSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool enabled, int hour, int minute});
}

/// @nodoc
class __$$_NotificationSettingsCopyWithImpl<$Res>
    extends _$NotificationSettingsCopyWithImpl<$Res, _$_NotificationSettings>
    implements _$$_NotificationSettingsCopyWith<$Res> {
  __$$_NotificationSettingsCopyWithImpl(_$_NotificationSettings _value,
      $Res Function(_$_NotificationSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? hour = null,
    Object? minute = null,
  }) {
    return _then(_$_NotificationSettings(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_NotificationSettings implements _NotificationSettings {
  const _$_NotificationSettings(
      {required this.enabled, required this.hour, required this.minute});

  @override
  final bool enabled;
  @override
  final int hour;
  @override
  final int minute;

  @override
  String toString() {
    return 'NotificationSettings(enabled: $enabled, hour: $hour, minute: $minute)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationSettings &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled, hour, minute);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationSettingsCopyWith<_$_NotificationSettings> get copyWith =>
      __$$_NotificationSettingsCopyWithImpl<_$_NotificationSettings>(
          this, _$identity);
}

abstract class _NotificationSettings implements NotificationSettings {
  const factory _NotificationSettings(
      {required final bool enabled,
      required final int hour,
      required final int minute}) = _$_NotificationSettings;

  @override
  bool get enabled;
  @override
  int get hour;
  @override
  int get minute;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationSettingsCopyWith<_$_NotificationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
