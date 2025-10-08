import 'package:aaliyahs_collection_estore/bottom_nav.dart';
import 'package:aaliyahs_collection_estore/provider/cart_provider.dart';
import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:aaliyahs_collection_estore/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;
      var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.all(15)),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavBar(),
                      ),
                    ),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    AaliyahCartTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Container(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: finalList.length,
                itemBuilder: (context, index) {
                  final cartItems = finalList[index];
                  return Stack(
                    
                    children: [
                      Padding(
                      
                        padding: EdgeInsets.all(15),
                        child: Container(
                          
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: isDarkMode ? AaliyahSecondaryColor : AaliyahPrimaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                
                                height: 120,
                                width: 100,
                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(cartItems.image),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItems.name,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge?.copyWith(
                                      color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                   Text(
                                    cartItems.category,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium?.copyWith(
                                      color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
                                          fontWeight: FontWeight.bold
                                    )
                                  ),
                                    SizedBox(height: 10),
                                      Text(
                                    "Rs. ${cartItems.price}",

                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium?.copyWith(
                                    color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
                                        fontWeight: FontWeight.bold
                                    )
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
