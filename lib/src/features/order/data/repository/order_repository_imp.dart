import 'package:nammkart/src/features/order/data/datasource/order_remote_datasource.dart';
import 'package:nammkart/src/features/order/domain/entities/order.dart';
import 'package:nammkart/src/features/order/domain/repository/order_repository.dart';

class OrderRepositoryImp implements OrderRepository {

  final OrderRemoteDatasource orderRemoteDatasource;

  OrderRepositoryImp(this.orderRemoteDatasource);


  @override
  Future<String> addOrder(token,order)=> orderRemoteDatasource.addOrder(token,order);

@override
 Future<List<OrderEntity>> getAllOrder(token)=> orderRemoteDatasource.getAllOrder(token);

}