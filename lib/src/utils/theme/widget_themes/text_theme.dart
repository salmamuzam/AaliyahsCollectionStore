import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Light and Dark Text Theme

class AaliyahTextTheme {
  AaliyahTextTheme._();

  // Light Theme

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: AaliyahDarkColor,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: AaliyahDarkColor,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: AaliyahDarkColor,
    ),
  );

  // Dark Theme

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: AaliyahLightColor,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: AaliyahLightColor,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: AaliyahLightColor,
    ),
  );
}
