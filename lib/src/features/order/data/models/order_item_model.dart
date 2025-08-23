import 'package:nammkart/src/features/order/domain/entities/order_item.dart';

class OrderItemModel extends OrderItemEntity {
  OrderItemModel(
      {super.image,
      required super.name,
      required super.quantity,
      required super.price,
      required super.productId});

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      name: json['name'],
      quantity: json['quantity'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      productId: json['productId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'image': image,
      'price': price,
      'productId': productId,
    };
  }
}
