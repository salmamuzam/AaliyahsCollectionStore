import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final CheckoutColors colors;

  const SectionTitle({super.key, required this.title, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(width: 4, height: 20, decoration: BoxDecoration(color: colors.primaryColor, borderRadius: BorderRadius.circular(2))),
      const SizedBox(width: 12),
      Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colors.textColor)),
    ]);
  }
}