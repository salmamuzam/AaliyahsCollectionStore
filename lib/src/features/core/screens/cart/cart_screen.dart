import 'package:aaliyahs_collection_estore/bottom_nav.dart';
import 'package:aaliyahs_collection_estore/provider/cart_provider.dart';
import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:aaliyahs_collection_estore/src/constants/text_strings.dart';
import 'package:aaliyahs_collection_estore/src/features/core/screens/cart/widgets/check_out.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;

    // Quantity buttons
    productQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          icon == Icons.add
              ? provider.incrementQtn(index)
              : provider.decrementQtn(index);
          setState(() {});
        },
        child: Icon(icon, size: 20),
      );
    }

    var isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BottomNavBar()),
          ),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          AaliyahCartTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      bottomSheet: const CheckOutBox(),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: finalList.length,
          itemBuilder: (context, index) {
            final cartItems = finalList[index];
            return Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isDarkMode ? AaliyahSecondaryColor : AaliyahPrimaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(cartItems.image),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItems.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            cartItems.category,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Rs. ${cartItems.price}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 35,
                  right: 20,
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          finalList.removeAt(index);
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.delete,
                          color: isDarkMode ? AaliyahPrimaryColor : AaliyahSecondaryColor,
                          size: 22,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: isDarkMode ? AaliyahPrimaryColor : AaliyahSecondaryColor,
                          border: Border.all(
                            color: Colors.blueGrey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            productQuantity(Icons.add, index),
                            const SizedBox(width: 10),
                            Text(
                              cartItems.quantity.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? AaliyahLightColor : AaliyahDarkColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            productQuantity(Icons.remove, index),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
