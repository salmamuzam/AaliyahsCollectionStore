import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:aaliyahs_collection_estore/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final double width, height;
  const AddButton({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
     final brightness = MediaQuery.platformBrightnessOf(context);
    final isDarkMode = brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? AaliyahSecondaryColor : AaliyahPrimaryColor,
        borderRadius: BorderRadius.circular(15)
      ) ,
      child: MaterialButton(onPressed: () {},
    child:  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.shopping_bag, color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,), 
        Text(AaliyahAddBagBtn,
        style: TextStyle(
color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
fontWeight: FontWeight.bold
        ),
        ),
      ],
    ),
    )
    
    );
  }
}
