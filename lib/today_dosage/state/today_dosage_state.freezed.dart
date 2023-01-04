// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_dosage_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodayDosageState {
  bool get taken => throw _privateConstructorUsedError;
  double get potency => throw _privateConstructorUsedError;
  bool get custom => throw _privateConstructorUsedError;
  bool get scheduleUndefined => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodayDosageStateCopyWith<TodayDosageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayDosageStateCopyWith<$Res> {
  factory $TodayDosageStateCopyWith(
          TodayDosageState value, $Res Function(TodayDosageState) then) =
      _$TodayDosageStateCopyWithImpl<$Res, TodayDosageState>;
  @useResult
  $Res call({bool taken, double potency, bool custom, bool scheduleUndefined});
}

/// @nodoc
class _$TodayDosageStateCopyWithImpl<$Res, $Val extends TodayDosageState>
    implements $TodayDosageStateCopyWith<$Res> {
  _$TodayDosageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taken = null,
    Object? potency = null,
    Object? custom = null,
    Object? scheduleUndefined = null,
  }) {
    return _then(_value.copyWith(
      taken: null == taken
          ? _value.taken
          : taken // ignore: cast_nullable_to_non_nullable
              as bool,
      potency: null == potency
          ? _value.potency
          : potency // ignore: cast_nullable_to_non_nullable
              as double,
      custom: null == custom
          ? _value.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as bool,
      scheduleUndefined: null == scheduleUndefined
          ? _value.scheduleUndefined
          : scheduleUndefined // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodayDosageStateCopyWith<$Res>
    implements $TodayDosageStateCopyWith<$Res> {
  factory _$$_TodayDosageStateCopyWith(
          _$_TodayDosageState value, $Res Function(_$_TodayDosageState) then) =
      __$$_TodayDosageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool taken, double potency, bool custom, bool scheduleUndefined});
}

/// @nodoc
class __$$_TodayDosageStateCopyWithImpl<$Res>
    extends _$TodayDosageStateCopyWithImpl<$Res, _$_TodayDosageState>
    implements _$$_TodayDosageStateCopyWith<$Res> {
  __$$_TodayDosageStateCopyWithImpl(
      _$_TodayDosageState _value, $Res Function(_$_TodayDosageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taken = null,
    Object? potency = null,
    Object? custom = null,
    Object? scheduleUndefined = null,
  }) {
    return _then(_$_TodayDosageState(
      taken: null == taken
          ? _value.taken
          : taken // ignore: cast_nullable_to_non_nullable
              as bool,
      potency: null == potency
          ? _value.potency
          : potency // ignore: cast_nullable_to_non_nullable
              as double,
      custom: null == custom
          ? _value.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as bool,
      scheduleUndefined: null == scheduleUndefined
          ? _value.scheduleUndefined
          : scheduleUndefined // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TodayDosageState implements _TodayDosageState {
  const _$_TodayDosageState(
      {required this.taken,
      required this.potency,
      required this.custom,
      required this.scheduleUndefined});

  @override
  final bool taken;
  @override
  final double potency;
  @override
  final bool custom;
  @override
  final bool scheduleUndefined;

  @override
  String toString() {
    return 'TodayDosageState(taken: $taken, potency: $potency, custom: $custom, scheduleUndefined: $scheduleUndefined)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodayDosageState &&
            (identical(other.taken, taken) || other.taken == taken) &&
            (identical(other.potency, potency) || other.potency == potency) &&
            (identical(other.custom, custom) || other.custom == custom) &&
            (identical(other.scheduleUndefined, scheduleUndefined) ||
                other.scheduleUndefined == scheduleUndefined));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, taken, potency, custom, scheduleUndefined);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodayDosageStateCopyWith<_$_TodayDosageState> get copyWith =>
      __$$_TodayDosageStateCopyWithImpl<_$_TodayDosageState>(this, _$identity);
}

abstract class _TodayDosageState implements TodayDosageState {
  const factory _TodayDosageState(
      {required final bool taken,
      required final double potency,
      required final bool custom,
      required final bool scheduleUndefined}) = _$_TodayDosageState;

  @override
  bool get taken;
  @override
  double get potency;
  @override
  bool get custom;
  @override
  bool get scheduleUndefined;
  @override
  @JsonKey(ignore: true)
  _$$_TodayDosageStateCopyWith<_$_TodayDosageState> get copyWith =>
      throw _privateConstructorUsedError;
}
