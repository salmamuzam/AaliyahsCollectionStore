import 'package:aaliyahs_collection_estore/src/features/core/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  // Add product to cart with initial quantity 1 - KEEP YOUR METHOD NAME
  void toggleFavorite(Product product) {
    // Check if product already exists in cart
    final existingIndex = _cart.indexWhere((item) => item.name == product.name);
    
    if (existingIndex != -1) {
      // If product exists, increase quantity
      _cart[existingIndex].quantity++;
    } else {
      // If product doesn't exist, add with quantity 1
      _cart.add(Product(
        name: product.name,
        category: product.category,
        price: product.price,
        description: product.description,
        image: product.image,
        quantity: 1, // Start with quantity 1
      ));
    }
    notifyListeners();
  }

  // Remove product from cart
  void removeFromCart(int index) {
    _cart.removeAt(index);
    notifyListeners();
  }

  incrementQtn(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  decrementQtn(int index) {
    if (_cart[index].quantity > 1) {
      _cart[index].quantity--;
    } else {
      // If quantity is 1 and user decreases, remove from cart
      removeFromCart(index);
    }
    notifyListeners();
  }

  totalPrice() {
    double total1 = 0.0;
    for (Product element in _cart) {
      total1 += element.price * element.quantity;
    }
    return total1;
  }

  // Clear cart after order
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  bool get isCartEmpty => _cart.isEmpty;

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}