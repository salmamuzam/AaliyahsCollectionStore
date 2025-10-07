import 'package:aaliyahs_collection_estore/data/data.dart';
import 'package:aaliyahs_collection_estore/models/product.dart';
import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      body: _buildUI(context),

      appBar: _appBar(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
      ],
    );
  }

  Widget _buildUI(BuildContext context) {
    return Column(
      children: [
        _productImage(context),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
        _productDetails(context),
      ],
    );
  }

  Widget _productImage(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDarkMode = brightness == Brightness.dark;
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.45,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(widget.product.image),
        ),
      ),
    );
  }

  Widget _productDetails(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.sizeOf(context).width,

        child: Column(children: [_productTitle()]),
      ),
    );
  }

  Widget _productTitle() {
    return Row(children: [
      Text(product.name),
    ],);
  }
}
