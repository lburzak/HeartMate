// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_highlight.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DayHighlight {
  bool get doseMissed => throw _privateConstructorUsedError;
  InrStatus get inrStatus => throw _privateConstructorUsedError;
  bool get hasNote => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DayHighlightCopyWith<DayHighlight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayHighlightCopyWith<$Res> {
  factory $DayHighlightCopyWith(
          DayHighlight value, $Res Function(DayHighlight) then) =
      _$DayHighlightCopyWithImpl<$Res, DayHighlight>;
  @useResult
  $Res call({bool doseMissed, InrStatus inrStatus, bool hasNote});
}

/// @nodoc
class _$DayHighlightCopyWithImpl<$Res, $Val extends DayHighlight>
    implements $DayHighlightCopyWith<$Res> {
  _$DayHighlightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doseMissed = null,
    Object? inrStatus = null,
    Object? hasNote = null,
  }) {
    return _then(_value.copyWith(
      doseMissed: null == doseMissed
          ? _value.doseMissed
          : doseMissed // ignore: cast_nullable_to_non_nullable
              as bool,
      inrStatus: null == inrStatus
          ? _value.inrStatus
          : inrStatus // ignore: cast_nullable_to_non_nullable
              as InrStatus,
      hasNote: null == hasNote
          ? _value.hasNote
          : hasNote // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DayHighlightCopyWith<$Res>
    implements $DayHighlightCopyWith<$Res> {
  factory _$$_DayHighlightCopyWith(
          _$_DayHighlight value, $Res Function(_$_DayHighlight) then) =
      __$$_DayHighlightCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool doseMissed, InrStatus inrStatus, bool hasNote});
}

/// @nodoc
class __$$_DayHighlightCopyWithImpl<$Res>
    extends _$DayHighlightCopyWithImpl<$Res, _$_DayHighlight>
    implements _$$_DayHighlightCopyWith<$Res> {
  __$$_DayHighlightCopyWithImpl(
      _$_DayHighlight _value, $Res Function(_$_DayHighlight) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doseMissed = null,
    Object? inrStatus = null,
    Object? hasNote = null,
  }) {
    return _then(_$_DayHighlight(
      doseMissed: null == doseMissed
          ? _value.doseMissed
          : doseMissed // ignore: cast_nullable_to_non_nullable
              as bool,
      inrStatus: null == inrStatus
          ? _value.inrStatus
          : inrStatus // ignore: cast_nullable_to_non_nullable
              as InrStatus,
      hasNote: null == hasNote
          ? _value.hasNote
          : hasNote // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DayHighlight implements _DayHighlight {
  const _$_DayHighlight(
      {required this.doseMissed,
      required this.inrStatus,
      required this.hasNote});

  @override
  final bool doseMissed;
  @override
  final InrStatus inrStatus;
  @override
  final bool hasNote;

  @override
  String toString() {
    return 'DayHighlight(doseMissed: $doseMissed, inrStatus: $inrStatus, hasNote: $hasNote)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DayHighlight &&
            (identical(other.doseMissed, doseMissed) ||
                other.doseMissed == doseMissed) &&
            (identical(other.inrStatus, inrStatus) ||
                other.inrStatus == inrStatus) &&
            (identical(other.hasNote, hasNote) || other.hasNote == hasNote));
  }

  @override
  int get hashCode => Object.hash(runtimeType, doseMissed, inrStatus, hasNote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DayHighlightCopyWith<_$_DayHighlight> get copyWith =>
      __$$_DayHighlightCopyWithImpl<_$_DayHighlight>(this, _$identity);
}

abstract class _DayHighlight implements DayHighlight {
  const factory _DayHighlight(
      {required final bool doseMissed,
      required final InrStatus inrStatus,
      required final bool hasNote}) = _$_DayHighlight;

  @override
  bool get doseMissed;
  @override
  InrStatus get inrStatus;
  @override
  bool get hasNote;
  @override
  @JsonKey(ignore: true)
  _$$_DayHighlightCopyWith<_$_DayHighlight> get copyWith =>
      throw _privateConstructorUsedError;
}
