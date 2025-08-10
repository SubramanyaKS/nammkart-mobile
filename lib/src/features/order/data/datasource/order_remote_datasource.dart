import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nammkart/src/config/environment/environment.dart';
import 'package:nammkart/src/features/order/data/models/order_model.dart';

class OrderRemoteDatasource {

  Future<String> addOrder(token,order) async{
    final response = await http.post(Uri.parse('${Environment.backendUrl}/api/orders/auth/order',),headers: {
      'Authorization': 'Bearer $token', // Add the token in the header
      'Content-Type': 'application/json',
    },body: jsonEncode(order));
    if(response.statusCode==201 || response.statusCode==200){
      return response.body.toString();
    }
    else{
      throw Exception('Error Occured');
    }
  }

 Future<List<OrderModel>> getAllOrder(token) async{
  final response = await http.get(Uri.parse('${Environment.backendUrl}/api/orders/auth/getorder',),headers: {
      'Authorization': 'Bearer $token', // Add the token in the header
      'Content-Type': 'application/json',
    });
    final List jsonData = json.decode(response.body);
    return jsonData.map((item) => OrderModel.fromJson(item)).toList();
 }

 Future<OrderModel> getOrderById(String token,String orderId) async {
    print(orderId);
   final response = await http.get(Uri.parse('${Environment.backendUrl}/api/orders/auth/ordered/${orderId}',),headers: {
     'Authorization': 'Bearer $token', // Add the token in the header
     'Content-Type': 'application/json',
   });
   final jsonData = json.decode(response.body);
   print(jsonData);
   return OrderModel.fromJson(jsonData);
 }
}

