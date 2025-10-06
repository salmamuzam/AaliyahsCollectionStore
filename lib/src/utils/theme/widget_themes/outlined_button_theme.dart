import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:aaliyahs_collection_estore/src/constants/sizes.dart';
import 'package:flutter/material.dart';

// Light and Dark Outlined Button Theme

class AaliyahOutlinedButtonTheme {
  AaliyahOutlinedButtonTheme._();

  // Light Theme

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: AaliyahPrimaryColor,
      side: BorderSide(color: AaliyahPrimaryColor),
      padding: EdgeInsets.symmetric(vertical: AaliyahButtonHeight),
    ),
  );

  // Dark Theme

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: AaliyahSecondaryColor,
      side: BorderSide(color: AaliyahSecondaryColor),
      padding: EdgeInsets.symmetric(vertical: AaliyahButtonHeight),
    ),
  );
}
