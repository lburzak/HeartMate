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
mixin _$ReportInrState {
  double get inr => throw _privateConstructorUsedError;

  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportInrStateCopyWith<ReportInrState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportInrStateCopyWith<$Res> {
  factory $ReportInrStateCopyWith(
          ReportInrState value, $Res Function(ReportInrState) then) =
      _$ReportInrStateCopyWithImpl<$Res, ReportInrState>;

  @useResult
  $Res call({double inr, String? error});
}

/// @nodoc
class _$ReportInrStateCopyWithImpl<$Res, $Val extends ReportInrState>
    implements $ReportInrStateCopyWith<$Res> {
  _$ReportInrStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inr = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      inr: null == inr
          ? _value.inr
          : inr // ignore: cast_nullable_to_non_nullable
              as double,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReportInrStateCopyWith<$Res>
    implements $ReportInrStateCopyWith<$Res> {
  factory _$$_ReportInrStateCopyWith(
          _$_ReportInrState value, $Res Function(_$_ReportInrState) then) =
      __$$_ReportInrStateCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({double inr, String? error});
}

/// @nodoc
class __$$_ReportInrStateCopyWithImpl<$Res>
    extends _$ReportInrStateCopyWithImpl<$Res, _$_ReportInrState>
    implements _$$_ReportInrStateCopyWith<$Res> {
  __$$_ReportInrStateCopyWithImpl(
      _$_ReportInrState _value, $Res Function(_$_ReportInrState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inr = null,
    Object? error = freezed,
  }) {
    return _then(_$_ReportInrState(
      inr: null == inr
          ? _value.inr
          : inr // ignore: cast_nullable_to_non_nullable
              as double,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ReportInrState implements _ReportInrState {
  const _$_ReportInrState({required this.inr, required this.error});

  @override
  final double inr;
  @override
  final String? error;

  @override
  String toString() {
    return 'ReportInrState(inr: $inr, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportInrState &&
            (identical(other.inr, inr) || other.inr == inr) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, inr, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportInrStateCopyWith<_$_ReportInrState> get copyWith =>
      __$$_ReportInrStateCopyWithImpl<_$_ReportInrState>(this, _$identity);
}

abstract class _ReportInrState implements ReportInrState {
  const factory _ReportInrState(
      {required final double inr,
      required final String? error}) = _$_ReportInrState;

  @override
  double get inr;

  @override
  String? get error;

  @override
  @JsonKey(ignore: true)
  _$$_ReportInrStateCopyWith<_$_ReportInrState> get copyWith =>
      throw _privateConstructorUsedError;
}
