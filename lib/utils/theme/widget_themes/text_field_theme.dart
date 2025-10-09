import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:flutter/material.dart';

// Light and Dark Text Theme

class AaliyahTextFormFieldTheme {
  AaliyahTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      InputDecorationTheme(
        border: OutlineInputBorder(),
        prefixIconColor: AaliyahPrimaryColor,
        floatingLabelStyle: TextStyle(color: AaliyahPrimaryColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AaliyahPrimaryColor),
        ),
      );

  static InputDecorationTheme darkInputDecorationTheme =
      InputDecorationTheme(
        border: OutlineInputBorder(),
        prefixIconColor: AaliyahSecondaryColor,
        floatingLabelStyle: TextStyle(color: AaliyahSecondaryColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AaliyahSecondaryColor),
        ),
      );
}
