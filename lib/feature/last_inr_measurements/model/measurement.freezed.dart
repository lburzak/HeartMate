// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'measurement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Measurement {
  double get value => throw _privateConstructorUsedError;
  DateTime get reportedAt => throw _privateConstructorUsedError;
  bool get isOutsideTherapeuticRange => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MeasurementCopyWith<Measurement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasurementCopyWith<$Res> {
  factory $MeasurementCopyWith(
          Measurement value, $Res Function(Measurement) then) =
      _$MeasurementCopyWithImpl<$Res, Measurement>;
  @useResult
  $Res call(
      {double value,
      DateTime reportedAt,
      bool isOutsideTherapeuticRange,
      bool isSelected});
}

/// @nodoc
class _$MeasurementCopyWithImpl<$Res, $Val extends Measurement>
    implements $MeasurementCopyWith<$Res> {
  _$MeasurementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? reportedAt = null,
    Object? isOutsideTherapeuticRange = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      reportedAt: null == reportedAt
          ? _value.reportedAt
          : reportedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isOutsideTherapeuticRange: null == isOutsideTherapeuticRange
          ? _value.isOutsideTherapeuticRange
          : isOutsideTherapeuticRange // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MeasurementCopyWith<$Res>
    implements $MeasurementCopyWith<$Res> {
  factory _$$_MeasurementCopyWith(
          _$_Measurement value, $Res Function(_$_Measurement) then) =
      __$$_MeasurementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double value,
      DateTime reportedAt,
      bool isOutsideTherapeuticRange,
      bool isSelected});
}

/// @nodoc
class __$$_MeasurementCopyWithImpl<$Res>
    extends _$MeasurementCopyWithImpl<$Res, _$_Measurement>
    implements _$$_MeasurementCopyWith<$Res> {
  __$$_MeasurementCopyWithImpl(
      _$_Measurement _value, $Res Function(_$_Measurement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? reportedAt = null,
    Object? isOutsideTherapeuticRange = null,
    Object? isSelected = null,
  }) {
    return _then(_$_Measurement(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      reportedAt: null == reportedAt
          ? _value.reportedAt
          : reportedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isOutsideTherapeuticRange: null == isOutsideTherapeuticRange
          ? _value.isOutsideTherapeuticRange
          : isOutsideTherapeuticRange // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Measurement implements _Measurement {
  const _$_Measurement(
      {required this.value,
      required this.reportedAt,
      required this.isOutsideTherapeuticRange,
      required this.isSelected});

  @override
  final double value;
  @override
  final DateTime reportedAt;
  @override
  final bool isOutsideTherapeuticRange;
  @override
  final bool isSelected;

  @override
  String toString() {
    return 'Measurement(value: $value, reportedAt: $reportedAt, isOutsideTherapeuticRange: $isOutsideTherapeuticRange, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Measurement &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.reportedAt, reportedAt) ||
                other.reportedAt == reportedAt) &&
            (identical(other.isOutsideTherapeuticRange,
                    isOutsideTherapeuticRange) ||
                other.isOutsideTherapeuticRange == isOutsideTherapeuticRange) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, value, reportedAt, isOutsideTherapeuticRange, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MeasurementCopyWith<_$_Measurement> get copyWith =>
      __$$_MeasurementCopyWithImpl<_$_Measurement>(this, _$identity);
}

abstract class _Measurement implements Measurement {
  const factory _Measurement(
      {required final double value,
      required final DateTime reportedAt,
      required final bool isOutsideTherapeuticRange,
      required final bool isSelected}) = _$_Measurement;

  @override
  double get value;
  @override
  DateTime get reportedAt;
  @override
  bool get isOutsideTherapeuticRange;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$_MeasurementCopyWith<_$_Measurement> get copyWith =>
      throw _privateConstructorUsedError;
}
