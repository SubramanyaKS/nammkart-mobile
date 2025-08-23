import 'package:flutter/material.dart';
import 'package:nammkart/src/features/cart/domain/entities/cart.dart';
import 'package:nammkart/src/features/order/domain/entities/order.dart';
import 'package:nammkart/src/features/order/domain/repository/order_repository.dart';
import 'package:nammkart/src/features/product/domain/entities/product.dart';

class OrderProvider with ChangeNotifier {
  final OrderRepository orderRepository;

  OrderProvider({required this.orderRepository});

  List<OrderEntity> _orders = [];
  List<OrderEntity> get orders => _orders;

  Future<void> getAllOrder(token) async {
    var data = await orderRepository.getAllOrder(token);
    _orders = data;
    notifyListeners();
  }

  Future<void> addOrder(token, order) async {
    await orderRepository.addOrder(token, order);
    notifyListeners();
  }

  Future<OrderEntity> getOrderById(token, orderId) async {
    var order = await orderRepository.getOrderById(token, orderId);

    return order;
  }

  List<Map<String, dynamic>> buildOrderItems(
    List<CartEntity> cartItems,
    List<ProductEntity> products,
  ) {
    List<Map<String, dynamic>> orderItems = [];

    for (var cartItem in cartItems) {
      final product = products.firstWhere(
        (prod) => prod.productID == cartItem.productId,
      );

      if (product.productID != '') {
        orderItems.add({
          "productId": product.productID,
          "name": product.productName,
          "image": product.imageUrl,
          "price": product.price,
          "quantity": cartItem.quantity,
        });
      }
    }

    return orderItems;
  }
}
