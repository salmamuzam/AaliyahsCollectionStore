import 'package:aaliyahs_collection_estore/src/features/core/models/product.dart';
import 'package:aaliyahs_collection_estore/src/constants/image_strings.dart';

// Contains data for all products, products by category, and best selling products as well

// All products

List<Product> products = [
  Product(
    name: "Closed Olive Abaya",
    category: "Abaya",
    price: 26200,
    description:
        "Elegant and timeless, our Closed Olive Abaya is crafted from premium matte crepe for all-day comfort. "
        "Features side pockets and a flowy silhouette perfect for both casual and formal occasions.",
    image: AaliyahAbayaImage3,
    quantity: 10,
  ),

  Product(
    name: "Butterfly Abaya - Desert",
    category: "Abaya",
    price: 29100,
    description:
        "A statement piece in soft desert tones — this Premium Butterfly Abaya features wide sleeves and an adjustable inner belt. "
        "Lightweight, breathable, and flattering for every body shape.",
    image: AaliyahAbayaImage2,
    quantity: 8,
  ),

  Product(
    name: "Linen Abaya - Burgundy",
    category: "Abaya",
    price: 22900,
    description:
        "Designed for effortless elegance, the Linen Abaya in Burgundy is made from a high-quality linen blend. "
        "An open-style cut with side pockets makes it both stylish and practical for everyday wear.",
    image: AaliyahAbayaImage1,
    quantity: 12,
  ),

  Product(
    name: "Jersey Hijab - Pink",
    category: "Hijab",
    price: 5500,
    description:
        "Soft and stretchy, this Cotton Candy Jersey Hijab provides maximum comfort and coverage. "
        "Its subtle pink hue adds a gentle touch to any outfit — ideal for daily wear or layering.",
    image: AaliyahHijabImage2,
    quantity: 25,
  ),

  Product(
    name: "Chiffon Hijab - Ice",
    category: "Hijab",
    price: 5800,
    description:
        "Our Luxury Crinkle Chiffon Hijab in Ice Blue offers a lightweight drape with a smooth, flowy texture. "
        "Perfect for elegant occasions and all-day comfort without slippage.",
    image: AaliyahHijabImage1,
    quantity: 30,
  ),

  Product(
    name: "Viscose Hijab - Shell",
    category: "Hijab",
    price: 4200,
    description:
        "A breathable and lightweight viscose hijab in a soft shell tone. "
        "Provides a natural, graceful drape — perfect for minimalist and modest fashion lovers.",
    image: AaliyahHijabImage3,
    quantity: 20,
  ),

  Product(
    name: "Bloom Dress - Petal",
    category: "Dress",
    price: 9290,
    description:
        "A feminine floral dress featuring pastel petal prints and a flowy A-line silhouette. "
        "Crafted from breathable chiffon for a light, airy feel that’s ideal for day events or garden gatherings.",
    image: AaliyahDressImage1,
    quantity: 7,
  ),

  Product(
    name: "Bloom Dress - View",
    category: "Dress",
    price: 7992,
    description:
        "Inspired by nature, the Floral Daydream Dress blends soft pastels and intricate blooms. "
        "Its relaxed fit and cinched waist flatter every figure for an elegant, dreamy look.",
    image: AaliyahDressImage2,
    quantity: 9,
  ),

  Product(
    name: "Dazed Dress - Sky",
    category: "Dress",
    price: 4875,
    description:
        "Stay effortlessly chic with our Dazed Dress in Sky Blue. "
        "Features a smocked neckline, elasticated sleeves, and a detachable belt for a customizable fit and flow.",
    image: AaliyahDressImage3,
    quantity: 15,
  ),

  Product(
    name: "Hijab Magnet - Gloss",
    category: "Accessory",
    price: 1900,
    description:
        "Strong yet gentle, our Gloss Hijab Magnets provide a secure hold without damaging fabric. "
        "Their sleek glossy finish complements any hijab style — no pins required!",
    image: AaliyahAccessoryImage2,
    quantity: 40,
  ),

  Product(
    name: "Destiny Chain - Floral",
    category: "Accessory",
    price: 1890,
    description:
        "A delicate Destiny Chain featuring subtle floral detailing. "
        "Lightweight and versatile — perfect for adding a feminine accent to your hijab or glasses.",
    image: AaliyahAccessoryImage1,
    quantity: 25,
  ),

  Product(
    name: "Chiffon Volumizer - Mustard",
    category: "Accessory",
    price: 890,
    description:
        "Soft and comfortable chiffon volumizer designed to create the perfect rounded shape under your hijab. "
        "Breathable, secure, and stylish in a warm mustard shade.",
    image: AaliyahAccessoryImage3,
    quantity: 35,
  ),
];

// Best Selling Products for Home Page

List<Product> bestSellingProducts = [
  products[0], // Closed Olive Abaya
  products[3], // Jersey Hijab - Pink
  products[6], // Bloom Dress - Petal
  products[9], // Hijab Magnet - Gloss
];

// Products by Category

List<Product> getProductsByCategory(String category) {
  return products.where((product) => product.category == category).toList();
}
