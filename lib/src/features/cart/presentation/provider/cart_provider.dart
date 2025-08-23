import 'package:flutter/material.dart';
import 'package:nammkart/src/features/cart/domain/entities/cart.dart';
import 'package:nammkart/src/features/product/domain/entities/product.dart';

class CartProvider with ChangeNotifier {
  final List<CartEntity> _items = [];
  double _totalPrice = 0.0;

  List<CartEntity> get items => _items;
  double get totalPrice => _totalPrice;

  void addToCart(String productId) {
    final existing = _items.indexWhere((item) => item.productId == productId);
    if (existing >= 0) {
      _items[existing].quantity++;
    } else {
      _items.add(CartEntity(productId: productId));
    }
    notifyListeners();
  }

  void getTotalPriceAsync(
    List<ProductEntity> products,
  ) async {
    double total = 0.0;

    for (var cartItem in _items) {
      final product =
          products.firstWhere((prod) => prod.productID == cartItem.productId);
      double discount = product.price;
      if (product.discountPrice != null) {
        discount = product.discountPrice!;
      }

      total += discount * cartItem.quantity;
    }

    _totalPrice = total;
    notifyListeners();
  }

  void increaseQuantity(String productId) {
    final item = _items.firstWhere((i) => i.productId == productId);
    item.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(String productId) {
    final item = _items.firstWhere((i) => i.productId == productId);
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(item);
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _items.removeWhere((item) => item.productId == productId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
