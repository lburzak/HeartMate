import 'package:flutter/material.dart';

class BrandTheme extends ThemeExtension<BrandTheme> {
  final Color goodColor;
  final Color badColor;

  const BrandTheme({
    required this.goodColor,
    required this.badColor,
  });

  @override
  ThemeExtension<BrandTheme> copyWith({Color? goodColor, Color? badColor}) {
    return BrandTheme(
        goodColor: goodColor ?? this.goodColor,
        badColor: badColor ?? this.badColor);
  }

  @override
  ThemeExtension<BrandTheme> lerp(BrandTheme? other, double t) {
    return BrandTheme(
        goodColor: Color.lerp(goodColor, other?.goodColor, t) ?? goodColor,
        badColor: Color.lerp(badColor, other?.badColor, t) ?? badColor);
  }

  static BrandTheme of(BuildContext context) =>
      Theme.of(context).extension<BrandTheme>()!;
}
