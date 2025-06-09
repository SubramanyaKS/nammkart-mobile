import 'package:nammkart/src/features/order/domain/entities/order.dart';

class OrderModel extends OrderEntity {

  OrderModel({
    super.userID,
    required super.orderItems,
    required super.paymentMethod,
    required super.totalPrice,
    required super.shippingAddress,
    super.isDelivered,
    super.isPaid,
    super.status
  });

}