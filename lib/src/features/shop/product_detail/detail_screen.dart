import 'package:aaliyahs_collection_estore/models/product.dart';
import 'package:aaliyahs_collection_estore/src/features/shop/product_detail/widgets/detail_app_bar.dart';
import 'package:aaliyahs_collection_estore/src/features/shop/product_detail/widgets/image_slider.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Back Button, Favorite
            const DetailAppBar(),

            // Image Slider
            DetailImageSlider(
              image: widget.product.image, // list of image paths
              onChange: (index) {
                setState(() {
                  currentImage = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
