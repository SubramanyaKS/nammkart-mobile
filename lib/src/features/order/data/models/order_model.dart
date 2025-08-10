import 'package:nammkart/src/features/address/data/model/address_model.dart';
import 'package:nammkart/src/features/order/data/models/order_item_model.dart';
import 'package:nammkart/src/features/order/domain/entities/order.dart';

class OrderModel extends OrderEntity {

  OrderModel({
    super.userID,
    required super.orderItems,
    required super.paymentMethod,
    required super.orderId,
    required super.totalPrice,
    required super.shippingAddress,
    super.isDelivered,
    super.isPaid,
    super.status,
    super.deliveredAt,
    super.orderedAt,
    super.paidAt,
  });

    factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderItems: (json['orderItems'] as List)
          .map((item) => OrderItemModel.fromJson(item))
          .toList(),
      userID: json['userID'],
      orderId:json['orderId'],
      totalPrice: (json['totalPrice'] as num).toDouble(),
      paymentMethod: json['paymentMethod'],
      shippingAddress: AddressModel.fromJson(json['shippingAddress']),
      isPaid: json['isPaid'],
      isDelivered: json['isDelivered'],
      deliveredAt: json['deliveredAt'] != null?DateTime.parse(json['deliveredAt']):null,
      paidAt: json['paidAt']!=null?DateTime.parse(json['paidAt']):null,
      orderedAt: DateTime.parse(json['orderedAt']),
      status: json['status'],
    );
  }

 Map<String, dynamic> toJson() {
    return {
      'orderItems': orderItems
          .map((item) => (item as OrderItemModel).toJson()),
      'userID': userID,
      'orderId':orderId,
      'totalPrice': totalPrice,
      'paymentMethod': paymentMethod,
      'shippingAddress':
          (shippingAddress as AddressModel).toJson(), // cast properly
      'isPaid': isPaid,
      'isDelivered': isDelivered,
      'status': status,
      'deliveredAt':deliveredAt?.toIso8601String(),
      'orderedAt':orderedAt?.toIso8601String(),
      'paidAt':paidAt?.toIso8601String(),
    };
  }

}