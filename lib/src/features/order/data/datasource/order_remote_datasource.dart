import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nammkart/src/config/environment/environment.dart';
import 'package:nammkart/src/config/utils/api_service.dart';
import 'package:nammkart/src/features/order/data/models/order_model.dart';

class OrderRemoteDatasource {
  final api = APIService();
  Future<String> addOrder(token, order) async {
    final response = await http.post(
        Uri.parse(
          '${Environment.backendUrl}/api/orders/auth/order',
        ),
        headers: {
          'Authorization': 'Bearer $token', // Add the token in the header
          'Content-Type': 'application/json',
        },
        body: jsonEncode(order));
    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body.toString();
    } else {
      throw Exception('Error Occured');
    }
  }

  Future<List<OrderModel>> getAllOrder(token) async {
    final response = await api.get(
        '/api/orders/auth/getorder',token: token);
    final List jsonData = json.decode(response.body);
    return jsonData.map((item) => OrderModel.fromJson(item)).toList();
  }

  Future<OrderModel> getOrderById(String token, String orderId) async {
    final response = await api.get('/api/orders/auth/ordered/$orderId', token: token);
    final jsonData = json.decode(response.body);
    return OrderModel.fromJson(jsonData);
  }
}
