import 'package:aaliyahs_collection_estore/provider/cart_provider.dart';
import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:aaliyahs_collection_estore/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class CheckOutBox extends StatelessWidget {
  const CheckOutBox({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isDarkMode = mediaQuery.platformBrightness == Brightness.dark;
    final provider = CartProvider.of(context);
    
    return Container(
      width: screenWidth, // Full width for responsiveness
      decoration: BoxDecoration(
        color: isDarkMode ? AaliyahSecondaryColor : AaliyahPrimaryColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AaliyahSubTotal,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
                ),
              ),
              Text(
                "Rs. ${provider.totalPrice()}",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AaliyahTotal,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
                ),
              ),
              Text(
                "Rs. ${provider.totalPrice()}",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Show order confirmation
              final snackBar = SnackBar(
                content: Text(
                  "Your Order has been Placed Successfully!",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: isDarkMode ? AaliyahPrimaryColor : AaliyahLightColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                duration: const Duration(seconds: 3),
                action: SnackBarAction(
                  label: 'OK',
                  onPressed: () {},
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              
              // Clear cart after successful order
              provider.clearCart();
            }, 
            style: ElevatedButton.styleFrom(
              backgroundColor: isDarkMode ? AaliyahPrimaryColor : AaliyahSecondaryColor,
              minimumSize: const Size(double.infinity, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ), 
            child: Text(
              AaliyahOrder, 
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDarkMode ? AaliyahLightColor : AaliyahDarkColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}