// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'time_of_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimeOfDay _$TimeOfDayFromJson(Map<String, dynamic> json) {
  return _TimeOfDay.fromJson(json);
}

/// @nodoc
mixin _$TimeOfDay {
  int get minute => throw _privateConstructorUsedError;
  int get hour => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeOfDayCopyWith<TimeOfDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeOfDayCopyWith<$Res> {
  factory $TimeOfDayCopyWith(TimeOfDay value, $Res Function(TimeOfDay) then) =
      _$TimeOfDayCopyWithImpl<$Res, TimeOfDay>;
  @useResult
  $Res call({int minute, int hour});
}

/// @nodoc
class _$TimeOfDayCopyWithImpl<$Res, $Val extends TimeOfDay>
    implements $TimeOfDayCopyWith<$Res> {
  _$TimeOfDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minute = null,
    Object? hour = null,
  }) {
    return _then(_value.copyWith(
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimeOfDayCopyWith<$Res> implements $TimeOfDayCopyWith<$Res> {
  factory _$$_TimeOfDayCopyWith(
          _$_TimeOfDay value, $Res Function(_$_TimeOfDay) then) =
      __$$_TimeOfDayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int minute, int hour});
}

/// @nodoc
class __$$_TimeOfDayCopyWithImpl<$Res>
    extends _$TimeOfDayCopyWithImpl<$Res, _$_TimeOfDay>
    implements _$$_TimeOfDayCopyWith<$Res> {
  __$$_TimeOfDayCopyWithImpl(
      _$_TimeOfDay _value, $Res Function(_$_TimeOfDay) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minute = null,
    Object? hour = null,
  }) {
    return _then(_$_TimeOfDay(
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimeOfDay implements _TimeOfDay {
  const _$_TimeOfDay({required this.minute, required this.hour});

  factory _$_TimeOfDay.fromJson(Map<String, dynamic> json) =>
      _$$_TimeOfDayFromJson(json);

  @override
  final int minute;
  @override
  final int hour;

  @override
  String toString() {
    return 'TimeOfDay(minute: $minute, hour: $hour)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimeOfDay &&
            (identical(other.minute, minute) || other.minute == minute) &&
            (identical(other.hour, hour) || other.hour == hour));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, minute, hour);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimeOfDayCopyWith<_$_TimeOfDay> get copyWith =>
      __$$_TimeOfDayCopyWithImpl<_$_TimeOfDay>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeOfDayToJson(
      this,
    );
  }
}

abstract class _TimeOfDay implements TimeOfDay {
  const factory _TimeOfDay(
      {required final int minute, required final int hour}) = _$_TimeOfDay;

  factory _TimeOfDay.fromJson(Map<String, dynamic> json) =
      _$_TimeOfDay.fromJson;

  @override
  int get minute;
  @override
  int get hour;
  @override
  @JsonKey(ignore: true)
  _$$_TimeOfDayCopyWith<_$_TimeOfDay> get copyWith =>
      throw _privateConstructorUsedError;
}
