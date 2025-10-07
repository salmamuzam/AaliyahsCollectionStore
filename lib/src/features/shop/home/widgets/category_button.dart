import 'package:aaliyahs_collection_estore/models/category.dart';
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
    double iconSize = MediaQuery.sizeOf(context).width * 0.05;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.03) ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isSelected ? AaliyahLightColor : AaliyahDarkColor
        ),
        color: isSelected ? AaliyahPrimaryColor : Colors.transparent,
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
          Text(category.name, style: TextStyle(color: isSelected ? AaliyahLightColor : AaliyahDarkColor)),
        ],
      ),
    );
  }
}
