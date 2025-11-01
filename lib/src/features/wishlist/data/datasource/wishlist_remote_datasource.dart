import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nammkart/src/config/environment/environment.dart';
import 'package:nammkart/src/config/utils/api_service.dart';
import 'package:nammkart/src/features/wishlist/data/models/wishlist_model.dart';

class WishlistRemoteDatasource {
  final api=APIService();
  Future<String> addWishlist(token, productId) async {
    final response = await http.post(
        Uri.parse(
          '${Environment.backendUrl}/api/wishlist/add',
        ),
        headers: {
          'Authorization': 'Bearer $token', // Add the token in the header
          'Content-Type': 'application/json',
        },
        body: jsonEncode(productId));
    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body.toString();
    } else {
      throw Exception('Error Occured');
    }
  }

  Future<WishlistModel> getWishlist(token) async {
    final response = await api.get('/api/wishlist/user', token:token);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data is List) {
        return WishlistModel.fromJson(data.first);
      }

      return WishlistModel.fromJson(data);
    } else {
      throw Exception('Failed to load wishlist');
    }
  }

  Future<String> deleteWishlist(token, productId) async {
    final response = await http.delete(
        Uri.parse(
          '${Environment.backendUrl}/api/wishlist/delete',
        ),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(productId));
    if (response.statusCode == 200) {
      return response.body.toString();
    } else {
      throw Exception('Error Occured');
    }
  }
}
