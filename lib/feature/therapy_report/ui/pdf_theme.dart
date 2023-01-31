import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdf_theme.freezed.dart';

@freezed
class PdfTheme with _$PdfTheme {
  const factory PdfTheme(
      {required TextStyle headerStyle,
      required TextStyle bodyStyle}) = _PdfTheme;
}
