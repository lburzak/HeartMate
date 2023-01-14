// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_preview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DayPreview {
  double get dosage => throw _privateConstructorUsedError;
  bool? get taken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DayPreviewCopyWith<DayPreview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayPreviewCopyWith<$Res> {
  factory $DayPreviewCopyWith(
          DayPreview value, $Res Function(DayPreview) then) =
      _$DayPreviewCopyWithImpl<$Res, DayPreview>;
  @useResult
  $Res call({double dosage, bool? taken});
}

/// @nodoc
class _$DayPreviewCopyWithImpl<$Res, $Val extends DayPreview>
    implements $DayPreviewCopyWith<$Res> {
  _$DayPreviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dosage = null,
    Object? taken = freezed,
  }) {
    return _then(_value.copyWith(
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as double,
      taken: freezed == taken
          ? _value.taken
          : taken // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DayPreviewCopyWith<$Res>
    implements $DayPreviewCopyWith<$Res> {
  factory _$$_DayPreviewCopyWith(
          _$_DayPreview value, $Res Function(_$_DayPreview) then) =
      __$$_DayPreviewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double dosage, bool? taken});
}

/// @nodoc
class __$$_DayPreviewCopyWithImpl<$Res>
    extends _$DayPreviewCopyWithImpl<$Res, _$_DayPreview>
    implements _$$_DayPreviewCopyWith<$Res> {
  __$$_DayPreviewCopyWithImpl(
      _$_DayPreview _value, $Res Function(_$_DayPreview) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dosage = null,
    Object? taken = freezed,
  }) {
    return _then(_$_DayPreview(
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as double,
      taken: freezed == taken
          ? _value.taken
          : taken // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_DayPreview implements _DayPreview {
  const _$_DayPreview({required this.dosage, this.taken});

  @override
  final double dosage;
  @override
  final bool? taken;

  @override
  String toString() {
    return 'DayPreview(dosage: $dosage, taken: $taken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DayPreview &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.taken, taken) || other.taken == taken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dosage, taken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DayPreviewCopyWith<_$_DayPreview> get copyWith =>
      __$$_DayPreviewCopyWithImpl<_$_DayPreview>(this, _$identity);
}

abstract class _DayPreview implements DayPreview {
  const factory _DayPreview({required final double dosage, final bool? taken}) =
      _$_DayPreview;

  @override
  double get dosage;
  @override
  bool? get taken;
  @override
  @JsonKey(ignore: true)
  _$$_DayPreviewCopyWith<_$_DayPreview> get copyWith =>
      throw _privateConstructorUsedError;
}
