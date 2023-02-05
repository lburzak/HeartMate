import 'package:flutter/material.dart';

class BrandTheme extends ThemeExtension<BrandTheme> {
  final Color goodColor;
  final Color goodTextColor;
  final Color badColor;
  final Color badTextColor;
  final Color warningColor;
  final Color warningTextColor;

  const BrandTheme(
      {required this.goodColor,
      required this.badColor,
      required this.badTextColor,
      required this.warningColor,
      required this.goodTextColor,
      required this.warningTextColor});

  @override
  ThemeExtension<BrandTheme> copyWith(
      {Color? goodColor,
      Color? badColor,
      Color? badTextColor,
      Color? warningColor,
      Color? warningTextColor,
      Color? goodTextColor}) {
    return BrandTheme(
        goodColor: goodColor ?? this.goodColor,
        badColor: badColor ?? this.badColor,
        badTextColor: badTextColor ?? this.badTextColor,
        warningColor: warningColor ?? this.warningColor,
        warningTextColor: warningTextColor ?? this.warningTextColor,
        goodTextColor: goodTextColor ?? this.goodTextColor);
  }

  @override
  ThemeExtension<BrandTheme> lerp(BrandTheme? other, double t) {
    return BrandTheme(
        goodColor: Color.lerp(goodColor, other?.goodColor, t) ?? goodColor,
        badColor: Color.lerp(badColor, other?.badColor, t) ?? badColor,
        warningColor:
            Color.lerp(warningColor, other?.warningColor, t) ?? warningColor,
        goodTextColor:
            Color.lerp(goodTextColor, other?.goodTextColor, t) ?? goodTextColor,
        warningTextColor:
            Color.lerp(warningTextColor, other?.warningTextColor, t) ??
                warningTextColor,
        badTextColor:
            Color.lerp(badTextColor, other?.badTextColor, t) ?? badTextColor);
  }

  static BrandTheme of(BuildContext context) =>
      Theme.of(context).extension<BrandTheme>()!;
}
