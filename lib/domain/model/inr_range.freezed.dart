// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'inr_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InrRange _$InrRangeFromJson(Map<String, dynamic> json) {
  return _InrRange.fromJson(json);
}

/// @nodoc
mixin _$InrRange {
  double get from => throw _privateConstructorUsedError;
  double get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InrRangeCopyWith<InrRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InrRangeCopyWith<$Res> {
  factory $InrRangeCopyWith(InrRange value, $Res Function(InrRange) then) =
      _$InrRangeCopyWithImpl<$Res, InrRange>;
  @useResult
  $Res call({double from, double to});
}

/// @nodoc
class _$InrRangeCopyWithImpl<$Res, $Val extends InrRange>
    implements $InrRangeCopyWith<$Res> {
  _$InrRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
  }) {
    return _then(_value.copyWith(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as double,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InrRangeCopyWith<$Res> implements $InrRangeCopyWith<$Res> {
  factory _$$_InrRangeCopyWith(
          _$_InrRange value, $Res Function(_$_InrRange) then) =
      __$$_InrRangeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double from, double to});
}

/// @nodoc
class __$$_InrRangeCopyWithImpl<$Res>
    extends _$InrRangeCopyWithImpl<$Res, _$_InrRange>
    implements _$$_InrRangeCopyWith<$Res> {
  __$$_InrRangeCopyWithImpl(
      _$_InrRange _value, $Res Function(_$_InrRange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
  }) {
    return _then(_$_InrRange(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as double,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InrRange implements _InrRange {
  const _$_InrRange({required this.from, required this.to});

  factory _$_InrRange.fromJson(Map<String, dynamic> json) =>
      _$$_InrRangeFromJson(json);

  @override
  final double from;
  @override
  final double to;

  @override
  String toString() {
    return 'InrRange(from: $from, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InrRange &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, from, to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InrRangeCopyWith<_$_InrRange> get copyWith =>
      __$$_InrRangeCopyWithImpl<_$_InrRange>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InrRangeToJson(
      this,
    );
  }
}

abstract class _InrRange implements InrRange {
  const factory _InrRange(
      {required final double from, required final double to}) = _$_InrRange;

  factory _InrRange.fromJson(Map<String, dynamic> json) = _$_InrRange.fromJson;

  @override
  double get from;
  @override
  double get to;
  @override
  @JsonKey(ignore: true)
  _$$_InrRangeCopyWith<_$_InrRange> get copyWith =>
      throw _privateConstructorUsedError;
}
