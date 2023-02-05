import 'package:apkainzynierka/theme/brand_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: Colors.lightBlue,
    textTheme: GoogleFonts.balooDa2TextTheme().apply(bodyColor: Colors.white),
    extensions: [
      const BrandTheme(
          goodColor: Color(0xff2F802D), badColor: Color(0xffF34E4E))
    ]);
