import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4E5AE8);
const Color yellowClr = Color(0XFFFFB746);
const Color pinkClr = Color(0xFFFF4667);
const Color white = Colors.white;
const Color primaryColor = Color(0xFFF7934A);
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF141414);

class Themes {
  static final light = ThemeData(
    appBarTheme: const AppBarTheme(
      color: Colors.white,
    ),
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    appBarTheme: const AppBarTheme(
      color: darkGreyClr,
    ),
    brightness: Brightness.dark,
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[400]));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400));
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ));
}
