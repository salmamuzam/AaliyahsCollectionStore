import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:flutter/material.dart';

class PaymentMethodSection extends StatelessWidget {
  final bool cashOnDelivery;
  final CheckoutColors colors;
  final Function(bool?) onChanged;

  const PaymentMethodSection({
    super.key,
    required this.cashOnDelivery,
    required this.colors,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colors.secondaryColor.withOpacity(0.5),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Checkbox
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: colors.secondaryColor.withOpacity(0.5)),
            ),
            child: Checkbox(
              value: cashOnDelivery,
              onChanged: onChanged,
              activeColor: colors.primaryColor,
              checkColor: Colors.white,
              shape: const CircleBorder(),
            ),
          ),

          const SizedBox(width: 16),

          // Payment Icon
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colors.secondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.money_outlined,
              color: colors.secondaryColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),

          // Payment Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cash on Delivery",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colors.textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Pay when you receive your order",
                  style: TextStyle(color: colors.textColor.withOpacity(0.7)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
