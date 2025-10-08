import 'package:aaliyahs_collection_estore/models/category.dart';
import 'package:aaliyahs_collection_estore/models/product.dart';
import 'package:aaliyahs_collection_estore/src/constants/image_strings.dart';

List<Category> categories = [
  Category(name: "Abaya", iconURL: AaliyahAbayaCategoryIcon),

  Category(name: "Dress", iconURL: AaliyahDressCategoryIcon),

  Category(name: "Hijab", iconURL: AaliyahHijabCategoryIcon),

  Category(name: "Accessory", iconURL: AaliyahAccessoryCategoryIcon),
];

List<Product> products = [
  Product(
    name: "Closed Olive Abaya",
    category: "Abaya",
    price: 26200,
    description: "Premium Plain Closed Abaya with Pockets",
    image: AaliyahAbayaImage3,
    quantity: 10,
  ),

  Product(
    name: "Butterfly Abaya - Desert",
    category: "Abaya",
    price: 29100,
    description: "Premium Closed Butterfly Abaya with Inner Belt",
    image: AaliyahAbayaImage2,
    quantity: 8,
  ),

  Product(
    name: "Linen Abaya - Burgundy",
    category: "Abaya",
    price: 22900,
    description: "Linen Blend Open Abaya with Pockets",
    image: AaliyahAbayaImage1,
    quantity: 12,
  ),

  Product(
    name: "Jersey Hijab - Pink",
    category: "Hijab",
    price: 5500,
    description: "Cotton Candy Jersey Hijab",
    image: AaliyahHijabImage2,
    quantity: 25,
  ),

  Product(
    name: "Chiffon Hijab - Ice",
    category: "Hijab",
    price: 5800,
    description: "Luxury Crinkle Chiffon Hijab - Ice Blue",
    image: AaliyahHijabImage1,
    quantity: 30,
  ),

  Product(
    name: "Viscose Hijab - Shell",
    category: "Hijab",
    price: 4200,
    description: "Lightweight Viscose Hijab - Shell",
    image: AaliyahHijabImage3,
    quantity: 20,
  ),

  Product(
    name: "Bloom Dress - Petal",
    category: "Dress",
    price: 9290,
    description: "Petal & Bloom Dress with pastel floral pattern",
    image: AaliyahDressImage1,
    quantity: 7,
  ),

  Product(
    name: "Bloom Dress - View",
    category: "Dress",
    price: 7992,
    description: "Floral Daydream Dress with pastel floral pattern",
    image: AaliyahDressImage2,
    quantity: 9,
  ),

  Product(
    name: "Dazed Dress - Sky",
    category: "Dress",
    price: 4875,
    description: "Smock neckline detail with elasticated sleeves with detached belt",
    image: AaliyahDressImage3,
    quantity: 15,
  ),

  Product(
    name: "Hijab Magnet - Gloss",
    category: "Accessory",
    price: 1900,
    description: "Strong magnet, suitable for all hijab fabrics",
    image: AaliyahAccessoryImage2,
    quantity: 40,
  ),

  Product(
    name: "Destiny Chain - Floral",
    category: "Accessory",
    price: 1890,
    description: "Lightweight, stylish, and designed to complement any outfit",
    image: AaliyahAccessoryImage1,
    quantity: 25,
  ),

  Product(
    name: "Chiffon Volumizer - Mustard",
    category: "Accessory",
    price: 890,
    description: "Gentle on the hair and perfectly sized to create a beautiful shape under your hijab",
    image: AaliyahAccessoryImage3,
    quantity: 35,
  ),
];
