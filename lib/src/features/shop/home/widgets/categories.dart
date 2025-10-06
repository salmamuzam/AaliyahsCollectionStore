import 'package:aaliyahs_collection_estore/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive circle size and spacing
    final circleSize = screenWidth > 800 ? 100.0 : 70.0;
    final spacing = screenWidth > 900 ? 250.0 : 23.0;

    return SizedBox(
      height: circleSize + 40, // circle + text height
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: EdgeInsets.symmetric(horizontal: spacing / 2),
        itemBuilder: (context, index) {
          final category = categories[index];

          return Column(
            children: [
                
              Container(
                height: circleSize,
                width: circleSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200, // background color
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    category.image,
                    fit: BoxFit.contain,
                    height: circleSize * 0.6, // icon occupies 60% of circle
                    width: circleSize * 0.6,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: circleSize + 20,
                child: Text(
                  category.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: spacing),
      ),
    );
  }
}
