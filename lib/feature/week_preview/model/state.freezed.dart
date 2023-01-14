// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeekPreviewState {
  List<DayPreview> get days => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeekPreviewStateCopyWith<WeekPreviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekPreviewStateCopyWith<$Res> {
  factory $WeekPreviewStateCopyWith(
          WeekPreviewState value, $Res Function(WeekPreviewState) then) =
      _$WeekPreviewStateCopyWithImpl<$Res, WeekPreviewState>;
  @useResult
  $Res call({List<DayPreview> days});
}

/// @nodoc
class _$WeekPreviewStateCopyWithImpl<$Res, $Val extends WeekPreviewState>
    implements $WeekPreviewStateCopyWith<$Res> {
  _$WeekPreviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
  }) {
    return _then(_value.copyWith(
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayPreview>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeekPreviewStateCopyWith<$Res>
    implements $WeekPreviewStateCopyWith<$Res> {
  factory _$$_WeekPreviewStateCopyWith(
          _$_WeekPreviewState value, $Res Function(_$_WeekPreviewState) then) =
      __$$_WeekPreviewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DayPreview> days});
}

/// @nodoc
class __$$_WeekPreviewStateCopyWithImpl<$Res>
    extends _$WeekPreviewStateCopyWithImpl<$Res, _$_WeekPreviewState>
    implements _$$_WeekPreviewStateCopyWith<$Res> {
  __$$_WeekPreviewStateCopyWithImpl(
      _$_WeekPreviewState _value, $Res Function(_$_WeekPreviewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
  }) {
    return _then(_$_WeekPreviewState(
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayPreview>,
    ));
  }
}

/// @nodoc

class _$_WeekPreviewState implements _WeekPreviewState {
  const _$_WeekPreviewState({required final List<DayPreview> days})
      : _days = days;

  final List<DayPreview> _days;
  @override
  List<DayPreview> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'WeekPreviewState(days: $days)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeekPreviewState &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_days));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeekPreviewStateCopyWith<_$_WeekPreviewState> get copyWith =>
      __$$_WeekPreviewStateCopyWithImpl<_$_WeekPreviewState>(this, _$identity);
}

abstract class _WeekPreviewState implements WeekPreviewState {
  const factory _WeekPreviewState({required final List<DayPreview> days}) =
      _$_WeekPreviewState;

  @override
  List<DayPreview> get days;
  @override
  @JsonKey(ignore: true)
  _$$_WeekPreviewStateCopyWith<_$_WeekPreviewState> get copyWith =>
      throw _privateConstructorUsedError;
}
