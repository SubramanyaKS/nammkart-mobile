import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nammkart/src/config/environment/environment.dart';

class APIService {
  Future<Map<String, String>> _headers({String? token}) async {
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Future<http.Response> get(String endpoint, {String? token}) async {
    final url = Uri.parse('${Environment.backendUrl}$endpoint');
    final headers = await _headers(token: token);

    try {
      final response = await http.get(url, headers: headers);
      _handleError(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> post(String endpoint,
      {Map<String, dynamic>? body, String? token}) async {
    final url = Uri.parse('${Environment.backendUrl}$endpoint');
    final headers = await _headers(token: token);

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body ?? {}),
      );
      _handleError(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> put(String endpoint,
      {Map<String, dynamic>? body, String? token}) async {
    final url = Uri.parse('${Environment.backendUrl}$endpoint');
    final headers = await _headers(token: token);

    try {
      final response = await http.put(
        url,
        headers: headers,
        body: jsonEncode(body ?? {}),
      );
      _handleError(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> delete(String endpoint,
      {Map<String, dynamic>? body, String? token}) async {
    final url = Uri.parse('${Environment.backendUrl}$endpoint');
    final headers = await _headers(token: token);
    try {
      final response = await http.delete(
        url,
        headers: headers,
        body: jsonEncode(body ?? {}),
      );
      _handleError(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> patch(String endpoint,
      {Map<String, dynamic>? body, String? token}) async {
    final url = Uri.parse('${Environment.backendUrl}$endpoint');
    final headers = await _headers(token: token);

    try {
      final response = await http.patch(
        url,
        headers: headers,
        body: jsonEncode(body ?? {}),
      );
      _handleError(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Error handling (basic)
  void _handleError(http.Response response) {
    if (response.statusCode >= 400) {
      throw Exception('HTTP Error ${response.statusCode}: ${response.body}');
    }
  }
}
