import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:aaliyahs_collection_estore/src/constants/sizes.dart';
import 'package:flutter/material.dart';

// Light and Dark Elevated Button Theme

class AaliyahElevatedButtonTheme {
  AaliyahElevatedButtonTheme._();

  // Light Theme

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      foregroundColor: AaliyahSecondaryColor,
      backgroundColor: AaliyahPrimaryColor,
      side: BorderSide(color: AaliyahPrimaryColor),
      padding: EdgeInsets.symmetric(vertical: AaliyahButtonHeight),
    ),
  );

  // Dark Theme

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      foregroundColor: AaliyahPrimaryColor,
      backgroundColor: AaliyahSecondaryColor,
      side: BorderSide(color: AaliyahSecondaryColor),
      padding: EdgeInsets.symmetric(vertical: AaliyahButtonHeight),
    ),
  );
}
