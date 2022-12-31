// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LastInrMeasurementsState {
  double get therapeuticInrBottom => throw _privateConstructorUsedError;
  double get therapeuticInrTop => throw _privateConstructorUsedError;
  List<Measurement> get measurements => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LastInrMeasurementsStateCopyWith<LastInrMeasurementsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastInrMeasurementsStateCopyWith<$Res> {
  factory $LastInrMeasurementsStateCopyWith(LastInrMeasurementsState value,
          $Res Function(LastInrMeasurementsState) then) =
      _$LastInrMeasurementsStateCopyWithImpl<$Res, LastInrMeasurementsState>;
  @useResult
  $Res call(
      {double therapeuticInrBottom,
      double therapeuticInrTop,
      List<Measurement> measurements});
}

/// @nodoc
class _$LastInrMeasurementsStateCopyWithImpl<$Res,
        $Val extends LastInrMeasurementsState>
    implements $LastInrMeasurementsStateCopyWith<$Res> {
  _$LastInrMeasurementsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? therapeuticInrBottom = null,
    Object? therapeuticInrTop = null,
    Object? measurements = null,
  }) {
    return _then(_value.copyWith(
      therapeuticInrBottom: null == therapeuticInrBottom
          ? _value.therapeuticInrBottom
          : therapeuticInrBottom // ignore: cast_nullable_to_non_nullable
              as double,
      therapeuticInrTop: null == therapeuticInrTop
          ? _value.therapeuticInrTop
          : therapeuticInrTop // ignore: cast_nullable_to_non_nullable
              as double,
      measurements: null == measurements
          ? _value.measurements
          : measurements // ignore: cast_nullable_to_non_nullable
              as List<Measurement>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LastInrMeasurementsStateCopyWith<$Res>
    implements $LastInrMeasurementsStateCopyWith<$Res> {
  factory _$$_LastInrMeasurementsStateCopyWith(
          _$_LastInrMeasurementsState value,
          $Res Function(_$_LastInrMeasurementsState) then) =
      __$$_LastInrMeasurementsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double therapeuticInrBottom,
      double therapeuticInrTop,
      List<Measurement> measurements});
}

/// @nodoc
class __$$_LastInrMeasurementsStateCopyWithImpl<$Res>
    extends _$LastInrMeasurementsStateCopyWithImpl<$Res,
        _$_LastInrMeasurementsState>
    implements _$$_LastInrMeasurementsStateCopyWith<$Res> {
  __$$_LastInrMeasurementsStateCopyWithImpl(_$_LastInrMeasurementsState _value,
      $Res Function(_$_LastInrMeasurementsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? therapeuticInrBottom = null,
    Object? therapeuticInrTop = null,
    Object? measurements = null,
  }) {
    return _then(_$_LastInrMeasurementsState(
      therapeuticInrBottom: null == therapeuticInrBottom
          ? _value.therapeuticInrBottom
          : therapeuticInrBottom // ignore: cast_nullable_to_non_nullable
              as double,
      therapeuticInrTop: null == therapeuticInrTop
          ? _value.therapeuticInrTop
          : therapeuticInrTop // ignore: cast_nullable_to_non_nullable
              as double,
      measurements: null == measurements
          ? _value._measurements
          : measurements // ignore: cast_nullable_to_non_nullable
              as List<Measurement>,
    ));
  }
}

/// @nodoc

class _$_LastInrMeasurementsState implements _LastInrMeasurementsState {
  const _$_LastInrMeasurementsState(
      {required this.therapeuticInrBottom,
      required this.therapeuticInrTop,
      required final List<Measurement> measurements})
      : _measurements = measurements;

  @override
  final double therapeuticInrBottom;
  @override
  final double therapeuticInrTop;
  final List<Measurement> _measurements;
  @override
  List<Measurement> get measurements {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_measurements);
  }

  @override
  String toString() {
    return 'LastInrMeasurementsState(therapeuticInrBottom: $therapeuticInrBottom, therapeuticInrTop: $therapeuticInrTop, measurements: $measurements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LastInrMeasurementsState &&
            (identical(other.therapeuticInrBottom, therapeuticInrBottom) ||
                other.therapeuticInrBottom == therapeuticInrBottom) &&
            (identical(other.therapeuticInrTop, therapeuticInrTop) ||
                other.therapeuticInrTop == therapeuticInrTop) &&
            const DeepCollectionEquality()
                .equals(other._measurements, _measurements));
  }

  @override
  int get hashCode => Object.hash(runtimeType, therapeuticInrBottom,
      therapeuticInrTop, const DeepCollectionEquality().hash(_measurements));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LastInrMeasurementsStateCopyWith<_$_LastInrMeasurementsState>
      get copyWith => __$$_LastInrMeasurementsStateCopyWithImpl<
          _$_LastInrMeasurementsState>(this, _$identity);
}

abstract class _LastInrMeasurementsState implements LastInrMeasurementsState {
  const factory _LastInrMeasurementsState(
          {required final double therapeuticInrBottom,
          required final double therapeuticInrTop,
          required final List<Measurement> measurements}) =
      _$_LastInrMeasurementsState;

  @override
  double get therapeuticInrBottom;
  @override
  double get therapeuticInrTop;
  @override
  List<Measurement> get measurements;
  @override
  @JsonKey(ignore: true)
  _$$_LastInrMeasurementsStateCopyWith<_$_LastInrMeasurementsState>
      get copyWith => throw _privateConstructorUsedError;
}
