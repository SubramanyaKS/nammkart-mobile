import 'package:nammkart/src/features/product/domain/entities/category.dart';
import 'package:nammkart/src/features/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> fetchAllProducts();
  Future<List<ProductEntity>> fetchByCategory(String category);
  Future<ProductEntity> fetchProductByID(String id);
  Future<List<CategoryEntity>> fetchAllCategory();
}