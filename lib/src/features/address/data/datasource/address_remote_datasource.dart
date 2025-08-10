import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nammkart/src/config/environment/environment.dart';
import 'package:nammkart/src/features/address/data/model/address_model.dart';
import 'package:nammkart/src/features/address/domain/entities/address.dart';

class AddressRemoteDatasource {

  Future<String> addAddress(userId,address) async{
    final response = await http.post(Uri.parse('${Environment.backendUrl}/api/users/auth/$userId/address/add',),headers: {
      "Content-Type": "application/json",
    },body: jsonEncode(address));

    if(response.statusCode==201 || response.statusCode==200){
      return response.body.toString();
    }
    else{
      throw Exception('Error Occured');
    }
  }

  Future<AddressEntity> viewAddress(userId) async{
    try{
      final response = await http.get(Uri.parse('${Environment.backendUrl}/api/users/auth/$userId/address'));
      final  jsonData = json.decode(response.body);
      return AddressModel.fromJson(jsonData);

    }catch(error){
      throw Exception('No Address Add one');
    }
  }

  Future<String> updateAddress(userId,address) async {
    try {
      final response = await http.put(Uri.parse('${Environment.backendUrl}/api/users/auth/$userId/address',),headers: {
      "Content-Type": "application/json",
    },body: jsonEncode(address));
    if(response.statusCode==201 || response.statusCode==200){
      return response.body.toString();
    }
     else{
      throw Exception('Error Occured');
    }

      
    } catch (e) {
      throw Exception('Not able to add Address');
      
    }
  }


}