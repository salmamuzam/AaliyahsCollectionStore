import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String image;
  final double price;
  final List<Color> colors;
  final String category;
  int quantity;

  Product({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.colors,
    required this.category,
    required this.quantity,
  });
}

final List<Product> products = [
  // 🖤 Abayas
  Product(
    title: "Elegant Black Abaya",
    description: "A classic abaya with soft premium fabric for daily wear.",
    image: "assets/images/products/luxury_georgette_dainty_black.webp",
    price: 7500.0,
    colors: [Colors.black, Colors.grey],
    category: "Abaya",
    quantity: 10,
  ),
  Product(
    title: "Lace Trim Abaya",
    description: "Beautiful lace detailing for a touch of elegance.",
    image: "assets/products/abaya_lace.png",
    price: 8200.0,
    colors: [Colors.indigo, Colors.brown],
    category: "Abaya",
    quantity: 7,
  ),
  Product(
    title: "Modern Open Abaya",
    description: "Trendy open-front abaya with matching belt.",
    image: "assets/products/abaya_open.png",
    price: 9000.0,
    colors: [Colors.black, Colors.deepPurple],
    category: "Abaya",
    quantity: 5,
  ),

  // 👗 Dresses
  Product(
    title: "Floral Maxi Dress",
    description: "Light and breezy floral dress, perfect for summer.",
    image: "assets/products/dress_floral.png",
    price: 5800.0,
    colors: [Colors.pink, Colors.lightBlue],
    category: "Dress",
    quantity: 9,
  ),
  Product(
    title: "Classic Long Dress",
    description: "Elegant long dress suitable for both formal and casual wear.",
    image: "assets/products/dress_long.png",
    price: 6200.0,
    colors: [Colors.red, Colors.black],
    category: "Dress",
    quantity: 8,
  ),
  Product(
    title: "Pleated Satin Dress",
    description:
        "Smooth satin texture with pleated detailing for a classy look.",
    image: "assets/products/dress_satin.png",
    price: 6900.0,
    colors: [Colors.green, Colors.amber],
    category: "Dress",
    quantity: 6,
  ),

  // 🧕 Hijabs
  Product(
    title: "Soft Chiffon Hijab",
    description: "Lightweight chiffon hijab perfect for everyday use.",
    image: "assets/products/hijab_chiffon.png",
    price: 1800.0,
    colors: [Colors.white, Colors.teal],
    category: "Hijab",
    quantity: 15,
  ),
  Product(
    title: "Silk Hijab",
    description: "Luxurious silk hijab that adds a touch of elegance.",
    image: "assets/products/hijab_silk.png",
    price: 2500.0,
    colors: [Colors.brown, Colors.purple],
    category: "Hijab",
    quantity: 12,
  ),
  Product(
    title: "Cotton Hijab",
    description: "Breathable and soft cotton hijab for all-day comfort.",
    image: "assets/products/hijab_cotton.png",
    price: 1500.0,
    colors: [Colors.grey, Colors.blue],
    category: "Hijab",
    quantity: 20,
  ),

  // 💍 Accessories
  Product(
    title: "Gold Plated Earrings",
    description: "Delicate gold-plated earrings to elevate your look.",
    image: "assets/products/accessory_earrings.png",
    price: 2200.0,
    colors: [Colors.amber, Colors.grey],
    category: "Accessory",
    quantity: 25,
  ),
  Product(
    title: "Pearl Necklace",
    description: "Classic pearl necklace perfect for formal occasions.",
    image: "assets/products/accessory_necklace.png",
    price: 3500.0,
    colors: [Colors.white, Colors.pinkAccent],
    category: "Accessory",
    quantity: 18,
  ),
  Product(
    title: "Leather Handbag",
    description: "Stylish and spacious handbag made from soft leather.",
    image: "assets/products/accessory_bag.png",
    price: 6800.0,
    colors: [Colors.brown, Colors.black],
    category: "Accessory",
    quantity: 10,
  ),
];
