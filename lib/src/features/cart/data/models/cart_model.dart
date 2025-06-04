import 'package:nammkart/src/features/cart/domain/entities/cart.dart';

class CartModel extends CartEntity{
  CartModel({
    required super.productId,
    super.quantity,
});
}