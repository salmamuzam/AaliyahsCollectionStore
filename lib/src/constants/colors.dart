import 'package:flutter/material.dart';

// List of all colors

const AaliyahPrimaryColor = Color(0xFF023239);
const AaliyahSecondaryColor = Color(0xFFEEC9AF);


const AaliyahLightColor = Color(0xFFF5F5F5);
const AaliyahDarkColor = Color(0xFF121212);

class CheckoutColors {
  final bool isDarkMode;
  
  CheckoutColors(this.isDarkMode);
  
  Color get primaryColor => AaliyahPrimaryColor;
  Color get secondaryColor => AaliyahSecondaryColor;
  Color get backgroundColor => isDarkMode ? AaliyahDarkColor : AaliyahLightColor;
  Color get textColor => isDarkMode ? AaliyahLightColor : AaliyahDarkColor;
  Color get surfaceColor => isDarkMode ? Color(0xFF2A2A2A) : Color(0xFFF8F5F2);
  Color get borderColor => isDarkMode ? Color(0xFF555555) : Color(0xFFE0D6CC);
  Color get successColor => Colors.green;
}