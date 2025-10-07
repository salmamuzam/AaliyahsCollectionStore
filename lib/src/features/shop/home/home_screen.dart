import 'package:aaliyahs_collection_estore/models/product.dart';
import 'package:aaliyahs_collection_estore/src/features/shop/home/widgets/categories.dart';
import 'package:aaliyahs_collection_estore/src/features/shop/home/widgets/custom_app_bar.dart';
import 'package:aaliyahs_collection_estore/src/features/shop/home/widgets/image_slider.dart';
import 'package:aaliyahs_collection_estore/src/features/shop/home/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 0),
              // Custom App Bar
              customAppBar(),
              const SizedBox(height: 20),
              ImageSlider(
                currentSlide: currentSlider,
                onChange: (value) {
                  setState(() {
                    currentSlider = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              //Category
              CategoriesWidget(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Selling Products",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ],
              ),

              // Shopping Items
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
