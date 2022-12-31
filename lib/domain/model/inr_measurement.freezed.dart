// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'inr_measurement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InrMeasurement {
  DateTime get reportDate => throw _privateConstructorUsedError;
  double get inr => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InrMeasurementCopyWith<InrMeasurement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InrMeasurementCopyWith<$Res> {
  factory $InrMeasurementCopyWith(
          InrMeasurement value, $Res Function(InrMeasurement) then) =
      _$InrMeasurementCopyWithImpl<$Res, InrMeasurement>;
  @useResult
  $Res call({DateTime reportDate, double inr});
}

/// @nodoc
class _$InrMeasurementCopyWithImpl<$Res, $Val extends InrMeasurement>
    implements $InrMeasurementCopyWith<$Res> {
  _$InrMeasurementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportDate = null,
    Object? inr = null,
  }) {
    return _then(_value.copyWith(
      reportDate: null == reportDate
          ? _value.reportDate
          : reportDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      inr: null == inr
          ? _value.inr
          : inr // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InrMeasurementCopyWith<$Res>
    implements $InrMeasurementCopyWith<$Res> {
  factory _$$_InrMeasurementCopyWith(
          _$_InrMeasurement value, $Res Function(_$_InrMeasurement) then) =
      __$$_InrMeasurementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime reportDate, double inr});
}

/// @nodoc
class __$$_InrMeasurementCopyWithImpl<$Res>
    extends _$InrMeasurementCopyWithImpl<$Res, _$_InrMeasurement>
    implements _$$_InrMeasurementCopyWith<$Res> {
  __$$_InrMeasurementCopyWithImpl(
      _$_InrMeasurement _value, $Res Function(_$_InrMeasurement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportDate = null,
    Object? inr = null,
  }) {
    return _then(_$_InrMeasurement(
      reportDate: null == reportDate
          ? _value.reportDate
          : reportDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      inr: null == inr
          ? _value.inr
          : inr // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_InrMeasurement implements _InrMeasurement {
  const _$_InrMeasurement({required this.reportDate, required this.inr});

  @override
  final DateTime reportDate;
  @override
  final double inr;

  @override
  String toString() {
    return 'InrMeasurement(reportDate: $reportDate, inr: $inr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InrMeasurement &&
            (identical(other.reportDate, reportDate) ||
                other.reportDate == reportDate) &&
            (identical(other.inr, inr) || other.inr == inr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reportDate, inr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InrMeasurementCopyWith<_$_InrMeasurement> get copyWith =>
      __$$_InrMeasurementCopyWithImpl<_$_InrMeasurement>(this, _$identity);
}

abstract class _InrMeasurement implements InrMeasurement {
  const factory _InrMeasurement(
      {required final DateTime reportDate,
      required final double inr}) = _$_InrMeasurement;

  @override
  DateTime get reportDate;
  @override
  double get inr;
  @override
  @JsonKey(ignore: true)
  _$$_InrMeasurementCopyWith<_$_InrMeasurement> get copyWith =>
      throw _privateConstructorUsedError;
}
