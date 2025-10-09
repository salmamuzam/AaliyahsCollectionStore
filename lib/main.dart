import 'package:aaliyahs_collection_estore/bottom_nav.dart';
import 'package:aaliyahs_collection_estore/provider/cart_provider.dart';
import 'package:aaliyahs_collection_estore/provider/favorite_provider.dart';
//import 'package:aaliyahs_collection_estore/sample.dart';
//import 'package:aaliyahs_collection_estore/src/features/authentication/screens/welcome/welcome_screen.dart';
//import 'package:aaliyahs_collection_estore/src/features/core/screens/home/home_screen.dart';
import 'package:aaliyahs_collection_estore/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AaliyahApp());
}

class AaliyahApp extends StatelessWidget {
  const AaliyahApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(providers: [
ChangeNotifierProvider(create: (_) => CartProvider()),
ChangeNotifierProvider(create: (_) => FavoriteProvider()),
  ],
  
  child: MaterialApp(
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
  )
  
  );
}
