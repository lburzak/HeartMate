// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return _Schedule.fromJson(json);
}

/// @nodoc
mixin _$Schedule {
  int get id => throw _privateConstructorUsedError;
  DateTime get effectiveFrom => throw _privateConstructorUsedError;
  List<double> get dosageScheme => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res, Schedule>;
  @useResult
  $Res call({int id, DateTime effectiveFrom, List<double> dosageScheme});
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res, $Val extends Schedule>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? effectiveFrom = null,
    Object? dosageScheme = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      effectiveFrom: null == effectiveFrom
          ? _value.effectiveFrom
          : effectiveFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dosageScheme: null == dosageScheme
          ? _value.dosageScheme
          : dosageScheme // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScheduleCopyWith<$Res> implements $ScheduleCopyWith<$Res> {
  factory _$$_ScheduleCopyWith(
          _$_Schedule value, $Res Function(_$_Schedule) then) =
      __$$_ScheduleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, DateTime effectiveFrom, List<double> dosageScheme});
}

/// @nodoc
class __$$_ScheduleCopyWithImpl<$Res>
    extends _$ScheduleCopyWithImpl<$Res, _$_Schedule>
    implements _$$_ScheduleCopyWith<$Res> {
  __$$_ScheduleCopyWithImpl(
      _$_Schedule _value, $Res Function(_$_Schedule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? effectiveFrom = null,
    Object? dosageScheme = null,
  }) {
    return _then(_$_Schedule(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      effectiveFrom: null == effectiveFrom
          ? _value.effectiveFrom
          : effectiveFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dosageScheme: null == dosageScheme
          ? _value._dosageScheme
          : dosageScheme // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Schedule implements _Schedule {
  const _$_Schedule(
      {required this.id,
      required this.effectiveFrom,
      required final List<double> dosageScheme})
      : _dosageScheme = dosageScheme;

  factory _$_Schedule.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleFromJson(json);

  @override
  final int id;
  @override
  final DateTime effectiveFrom;
  final List<double> _dosageScheme;
  @override
  List<double> get dosageScheme {
    if (_dosageScheme is EqualUnmodifiableListView) return _dosageScheme;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dosageScheme);
  }

  @override
  String toString() {
    return 'Schedule(id: $id, effectiveFrom: $effectiveFrom, dosageScheme: $dosageScheme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Schedule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.effectiveFrom, effectiveFrom) ||
                other.effectiveFrom == effectiveFrom) &&
            const DeepCollectionEquality()
                .equals(other._dosageScheme, _dosageScheme));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, effectiveFrom,
      const DeepCollectionEquality().hash(_dosageScheme));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScheduleCopyWith<_$_Schedule> get copyWith =>
      __$$_ScheduleCopyWithImpl<_$_Schedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleToJson(
      this,
    );
  }
}

abstract class _Schedule implements Schedule {
  const factory _Schedule(
      {required final int id,
      required final DateTime effectiveFrom,
      required final List<double> dosageScheme}) = _$_Schedule;

  factory _Schedule.fromJson(Map<String, dynamic> json) = _$_Schedule.fromJson;

  @override
  int get id;
  @override
  DateTime get effectiveFrom;
  @override
  List<double> get dosageScheme;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleCopyWith<_$_Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}
