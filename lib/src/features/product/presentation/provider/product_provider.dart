import 'package:flutter/material.dart';
import 'package:nammkart/src/features/product/domain/entities/category.dart';
import 'package:nammkart/src/features/product/domain/entities/product.dart';
import 'package:nammkart/src/features/product/domain/repository/product_repository.dart';

class ProductProvider with ChangeNotifier {

final ProductRepository repository;

  ProductProvider({required this.repository});

  List<ProductEntity> _products = [];
  List<CategoryEntity> _category = [];
  List<ProductEntity> _filteredProducts = [];

  List<ProductEntity> get products => _products;
  List<CategoryEntity> get category => _category;
  List<ProductEntity> get filteredProducts =>_filteredProducts;

  List<ProductEntity>  getTopProducts() {
    return _products.take(5).toList();
  }
  List<ProductEntity> getTopRatedProducts(){
    List<ProductEntity> data = List.from(_products)..sort((a, b) => b.rating.compareTo(a.rating));
    return data.take(5).toList();
  }

   Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      _filteredProducts = _products;
    } else {
      _filteredProducts = _products
          .where((product) =>
          product.productName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  Future<void> fetchProducts() async {
    var data = await repository.fetchAllProducts();
    _products=data;
    notifyListeners();
  }

  Future<void> searchProductsByCategory(String category) async {
    if (category.isEmpty) {
      _filteredProducts = _products;
    } else {
      _filteredProducts = _products
          .where((product) =>
          product.category.toLowerCase().contains(category.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  Future<void> fetchCategory() async {
    var data = await repository.fetchAllCategory();
    _category=data;
    notifyListeners();
  }

  Future<ProductEntity> fetchSingleProduct(productId) async {
    var prod = await repository.fetchProductByID(productId);
    return prod;
  }

}