// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_dosage_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomDosageState {
  double get dosage => throw _privateConstructorUsedError;
  int get step => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomDosageStateCopyWith<CustomDosageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomDosageStateCopyWith<$Res> {
  factory $CustomDosageStateCopyWith(
          CustomDosageState value, $Res Function(CustomDosageState) then) =
      _$CustomDosageStateCopyWithImpl<$Res, CustomDosageState>;
  @useResult
  $Res call({double dosage, int step});
}

/// @nodoc
class _$CustomDosageStateCopyWithImpl<$Res, $Val extends CustomDosageState>
    implements $CustomDosageStateCopyWith<$Res> {
  _$CustomDosageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dosage = null,
    Object? step = null,
  }) {
    return _then(_value.copyWith(
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as double,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomDosageStateCopyWith<$Res>
    implements $CustomDosageStateCopyWith<$Res> {
  factory _$$_CustomDosageStateCopyWith(_$_CustomDosageState value,
          $Res Function(_$_CustomDosageState) then) =
      __$$_CustomDosageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double dosage, int step});
}

/// @nodoc
class __$$_CustomDosageStateCopyWithImpl<$Res>
    extends _$CustomDosageStateCopyWithImpl<$Res, _$_CustomDosageState>
    implements _$$_CustomDosageStateCopyWith<$Res> {
  __$$_CustomDosageStateCopyWithImpl(
      _$_CustomDosageState _value, $Res Function(_$_CustomDosageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dosage = null,
    Object? step = null,
  }) {
    return _then(_$_CustomDosageState(
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as double,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CustomDosageState implements _CustomDosageState {
  const _$_CustomDosageState({required this.dosage, required this.step});

  @override
  final double dosage;
  @override
  final int step;

  @override
  String toString() {
    return 'CustomDosageState(dosage: $dosage, step: $step)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomDosageState &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.step, step) || other.step == step));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dosage, step);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomDosageStateCopyWith<_$_CustomDosageState> get copyWith =>
      __$$_CustomDosageStateCopyWithImpl<_$_CustomDosageState>(
          this, _$identity);
}

abstract class _CustomDosageState implements CustomDosageState {
  const factory _CustomDosageState(
      {required final double dosage,
      required final int step}) = _$_CustomDosageState;

  @override
  double get dosage;
  @override
  int get step;
  @override
  @JsonKey(ignore: true)
  _$$_CustomDosageStateCopyWith<_$_CustomDosageState> get copyWith =>
      throw _privateConstructorUsedError;
}
