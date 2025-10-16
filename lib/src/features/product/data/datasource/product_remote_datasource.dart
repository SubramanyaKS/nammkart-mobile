import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nammkart/src/config/environment/environment.dart';
import 'package:nammkart/src/config/utils/api_service.dart';
import 'package:nammkart/src/features/product/data/models/category_model.dart';
import 'package:nammkart/src/features/product/data/models/product_model.dart';

class ProductRemoteDatasource {
  final api = APIService();

  Future<List<ProductModel>> fetchAllProducts() async {
    final response =await api.get('/api/products');
    final List jsonData = json.decode(response.body);
    return jsonData.map((item) => ProductModel.fromJson(item)).toList();
  }

  Future<List<CategoryModel>> fetchAllCategory() async {
    final response = await api.get('/api/category');
    final List jsonData = json.decode(response.body);
    return jsonData.map((item) => CategoryModel.fromJson(item)).toList();
  }

  Future<List<ProductModel>> fetchByCategory(String category) async {
    final response = await api.get('/api/products/category?category=$category');
    final List jsonData = json.decode(response.body);
    return jsonData.map((item) => ProductModel.fromJson(item)).toList();
  }

  Future<ProductModel> fetchProductByID(String id) async {
    final response = await api.get('/api/products/$id');
    final jsonData = json.decode(response.body);
    return ProductModel.fromJson(jsonData);
  }
}
