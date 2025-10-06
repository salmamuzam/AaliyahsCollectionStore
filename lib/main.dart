import 'package:aaliyahs_collection_estore/bottom_nav.dart';
//import 'package:aaliyahs_collection_estore/src/features/shop/product/product_screen.dart';
import 'package:aaliyahs_collection_estore/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AaliyahApp());
}

class AaliyahApp extends StatelessWidget {
  const AaliyahApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aaliyah\'s Collection',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AaliyahAppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(
          AaliyahAppTheme.lightTheme.textTheme,
        ),
      ),
      darkTheme: AaliyahAppTheme.darkTheme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(
          AaliyahAppTheme.darkTheme.textTheme,
        ),
      ),
      home: BottomNavBar(),
    );
  }
}
