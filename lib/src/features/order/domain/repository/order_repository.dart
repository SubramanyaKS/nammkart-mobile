import 'package:nammkart/src/features/order/domain/entities/order.dart';

abstract class OrderRepository {
  Future<String> addOrder(token,order);
  Future<List<OrderEntity>> getAllOrder(token);
  Future<OrderEntity> getOrderById(token,orderId);

}