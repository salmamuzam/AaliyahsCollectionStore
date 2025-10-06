import 'package:aaliyahs_collection_estore/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:aaliyahs_collection_estore/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:aaliyahs_collection_estore/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:aaliyahs_collection_estore/src/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class AaliyahAppTheme {
  // To avoid creating instances
  AaliyahAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: AaliyahTextTheme.lightTextTheme,
    outlinedButtonTheme: AaliyahOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: AaliyahElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: AaliyahTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: AaliyahTextTheme.darkTextTheme,
    outlinedButtonTheme: AaliyahOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: AaliyahElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: AaliyahTextFormFieldTheme.darkInputDecorationTheme,
  );
}
