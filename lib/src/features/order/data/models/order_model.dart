import 'package:nammkart/src/features/address/data/model/address_model.dart';
import 'package:nammkart/src/features/order/data/models/order_item_model.dart';
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

    factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderItems: (json['orderItems'] as List)
          .map((item) => OrderItemModel.fromJson(item))
          .toList(),
      userID: json['userID'],
      totalPrice: (json['totalPrice'] as num).toDouble(),
      paymentMethod: json['paymentMethod'],
      shippingAddress: AddressModel.fromJson(json['shippingAddress']),
      isPaid: json['isPaid'],
      isDelivered: json['isDelivered'],
      status: json['status'],
    );
  }

 Map<String, dynamic> toJson() {
    return {
      'orderItems': orderItems
          .map((item) => (item as OrderItemModel).toJson())
          .toList(),
      'userID': userID,
      'totalPrice': totalPrice,
      'paymentMethod': paymentMethod,
      'shippingAddress':
          (shippingAddress as AddressModel).toJson(), // cast properly
      'isPaid': isPaid,
      'isDelivered': isDelivered,
      'status': status,
    };
  }

}