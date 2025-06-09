import 'package:nammkart/src/features/address/domain/entities/address.dart';
import 'package:nammkart/src/features/order/domain/entities/order_item.dart';

class OrderEntity{
  final OrderItemEntity orderItems;
  final String? userID;
  final double totalPrice;
  final String paymentMethod;
  final AddressEntity shippingAddress;
  final bool? isPaid;
  final bool? isDelivered;
  final String? status;


  OrderEntity({required this.orderItems, required this.shippingAddress,this.userID,required this.totalPrice, required this.paymentMethod, this.isPaid, this.isDelivered, this.status, });
}