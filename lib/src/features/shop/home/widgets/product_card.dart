import 'package:aaliyahs_collection_estore/models/product.dart';
import 'package:aaliyahs_collection_estore/src/features/shop/product_detail/detail_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(product: product,)),
        );
      },
      child: Container(
        width: double.infinity,

        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(blurRadius: 6, offset: Offset(0, 2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Center(
              child: Image.asset(
                product.image,
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                product.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    // show Rs with no decimals when price is whole, otherwise show 2 decimals
                    'Rs ${product.price % 1 == 0 ? product.price.toInt() : product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: List.generate(
                      product.colors.length,
                      (index) => Container(
                        width: 18,
                        height: 18,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                          color: product.colors[index],
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
