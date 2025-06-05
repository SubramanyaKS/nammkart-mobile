import 'package:nammkart/src/features/order/domain/entities/order_item.dart';

class OrderItemModel extends OrderItemEntity {

  OrderItemModel({
    super.image,
    required super.name,
    required super.quantity,
    required super.price,
    required super.productId
  });

}