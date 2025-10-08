import 'package:aaliyahs_collection_estore/models/product.dart';
import 'package:aaliyahs_collection_estore/provider/favorite_provider.dart';
import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final EdgeInsets margin;
  final Function onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.margin = const EdgeInsets.only(),
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDarkMode = brightness == Brightness.dark;
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: margin,
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.01,
          horizontal: MediaQuery.sizeOf(context).width * 0.03,
        ),
        decoration: BoxDecoration(
          color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(product.image),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _pricingInformation(context),
            Text(
              product.name,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
                fontWeight: FontWeight.w900,
                backgroundColor: isDarkMode
                    ? AaliyahSecondaryColor
                    : AaliyahPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pricingInformation(BuildContext context) {
        final provider = FavoriteProvider.of(context);
    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDarkMode = brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Rs. ${product.price.toString()}",
          style: TextStyle(
            color: isDarkMode ? AaliyahDarkColor : AaliyahDarkColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            provider.toggleFavorite(product);
          },
          
          child: Icon(
            provider.isExist(product)?
            Icons.favorite:
            Icons.favorite_outline,
            color: isDarkMode ? AaliyahDarkColor : AaliyahDarkColor,
            size: 22,
          ),
        ),
      ],
    );
  }
}

