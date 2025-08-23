import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nammkart/src/config/environment/environment.dart';
import 'package:nammkart/src/features/auth/data/models/user_model.dart';
import 'package:nammkart/src/features/auth/domain/entities/user.dart';

class UserRemoteDatasource {
  Future<String> userSignup(user) async {
    final response = await http.post(
        Uri.parse(
          '${Environment.backendUrl}/api/users/auth/register',
        ),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(user));
    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body.toString();
    } else {
      throw Exception('Error Occured');
    }
  }

  Future<String> userLogin(user) async {
    final response = await http.post(
        Uri.parse(
          '${Environment.backendUrl}/api/users/auth/login',
        ),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(user));
    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body.toString();
    } else {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final String message = data['message'] ?? 'Unexpected error';
      throw Exception(message);
    }
  }

  Future<UserEntity> userByEmail(token) async {
    try {
      final response = await http.get(
        Uri.parse('${Environment.backendUrl}/api/users/auth/user/email'),
        headers: {
          'Authorization': 'Bearer $token', // Add the token in the header
          'Content-Type': 'application/json',
        },
      );
      final jsonData = json.decode(response.body);
      return UserModel.fromJson(jsonData);
    } catch (error) {
      throw Exception(error);
    }
  }
}
