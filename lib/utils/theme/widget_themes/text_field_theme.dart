import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:flutter/material.dart';

// Light and Dark Text Theme

class AaliyahTextFormFieldTheme {
  AaliyahTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
        prefixIconColor: AaliyahPrimaryColor,
        floatingLabelStyle: TextStyle(color: AaliyahPrimaryColor),
        focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(width: 2, color: AaliyahPrimaryColor),
        ),
      );

  static InputDecorationTheme darkInputDecorationTheme =
      InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
        prefixIconColor: AaliyahSecondaryColor,
        floatingLabelStyle: TextStyle(color: AaliyahSecondaryColor),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(width: 2, color: AaliyahSecondaryColor),
        ),
      );
}
