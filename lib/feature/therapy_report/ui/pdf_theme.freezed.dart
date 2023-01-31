// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdf_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PdfTheme {
  TextStyle get headerStyle => throw _privateConstructorUsedError;
  TextStyle get bodyStyle => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PdfThemeCopyWith<PdfTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfThemeCopyWith<$Res> {
  factory $PdfThemeCopyWith(PdfTheme value, $Res Function(PdfTheme) then) =
      _$PdfThemeCopyWithImpl<$Res, PdfTheme>;
  @useResult
  $Res call({TextStyle headerStyle, TextStyle bodyStyle});
}

/// @nodoc
class _$PdfThemeCopyWithImpl<$Res, $Val extends PdfTheme>
    implements $PdfThemeCopyWith<$Res> {
  _$PdfThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headerStyle = null,
    Object? bodyStyle = null,
  }) {
    return _then(_value.copyWith(
      headerStyle: null == headerStyle
          ? _value.headerStyle
          : headerStyle // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      bodyStyle: null == bodyStyle
          ? _value.bodyStyle
          : bodyStyle // ignore: cast_nullable_to_non_nullable
              as TextStyle,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PdfThemeCopyWith<$Res> implements $PdfThemeCopyWith<$Res> {
  factory _$$_PdfThemeCopyWith(
          _$_PdfTheme value, $Res Function(_$_PdfTheme) then) =
      __$$_PdfThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TextStyle headerStyle, TextStyle bodyStyle});
}

/// @nodoc
class __$$_PdfThemeCopyWithImpl<$Res>
    extends _$PdfThemeCopyWithImpl<$Res, _$_PdfTheme>
    implements _$$_PdfThemeCopyWith<$Res> {
  __$$_PdfThemeCopyWithImpl(
      _$_PdfTheme _value, $Res Function(_$_PdfTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headerStyle = null,
    Object? bodyStyle = null,
  }) {
    return _then(_$_PdfTheme(
      headerStyle: null == headerStyle
          ? _value.headerStyle
          : headerStyle // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      bodyStyle: null == bodyStyle
          ? _value.bodyStyle
          : bodyStyle // ignore: cast_nullable_to_non_nullable
              as TextStyle,
    ));
  }
}

/// @nodoc

class _$_PdfTheme implements _PdfTheme {
  const _$_PdfTheme({required this.headerStyle, required this.bodyStyle});

  @override
  final TextStyle headerStyle;
  @override
  final TextStyle bodyStyle;

  @override
  String toString() {
    return 'PdfTheme(headerStyle: $headerStyle, bodyStyle: $bodyStyle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PdfTheme &&
            (identical(other.headerStyle, headerStyle) ||
                other.headerStyle == headerStyle) &&
            (identical(other.bodyStyle, bodyStyle) ||
                other.bodyStyle == bodyStyle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, headerStyle, bodyStyle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PdfThemeCopyWith<_$_PdfTheme> get copyWith =>
      __$$_PdfThemeCopyWithImpl<_$_PdfTheme>(this, _$identity);
}

abstract class _PdfTheme implements PdfTheme {
  const factory _PdfTheme(
      {required final TextStyle headerStyle,
      required final TextStyle bodyStyle}) = _$_PdfTheme;

  @override
  TextStyle get headerStyle;
  @override
  TextStyle get bodyStyle;
  @override
  @JsonKey(ignore: true)
  _$$_PdfThemeCopyWith<_$_PdfTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
