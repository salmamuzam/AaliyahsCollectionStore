import 'package:aaliyahs_collection_estore/src/features/core/models/category.dart';
import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final Category category;
  final bool isSelected;

  const CategoryButton({
    super.key,
    required this.category,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDarkMode = brightness == Brightness.dark;

    double iconSize = MediaQuery.sizeOf(context).width * 0.05;

    // Background color
    final backgroundColor = isDarkMode
        ? (isSelected ? AaliyahPrimaryColor : AaliyahSecondaryColor)
        : (isSelected ? AaliyahSecondaryColor : AaliyahPrimaryColor);

    // Text color
    final textColor = isDarkMode
        ? (isSelected ? Colors.white : Colors.black)
        : (isSelected ? Colors.black : Colors.white);

    // Border color
    final borderColor = isDarkMode ? Colors.white : Colors.black;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.03,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: iconSize,
            width: iconSize,
            margin: const EdgeInsets.only(right: 10),
            child: Image.asset(category.iconURL),
          ),
          Text(category.name, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }
}
