import 'package:nammkart/src/features/product/data/datasource/product_remote_datasource.dart';
import 'package:nammkart/src/features/product/domain/entities/category.dart';
import 'package:nammkart/src/features/product/domain/entities/product.dart';
import 'package:nammkart/src/features/product/domain/repository/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {

    final ProductRemoteDatasource remoteDataSource;

     ProductRepositoryImp(this.remoteDataSource);

    @override
     Future<List<ProductEntity>> fetchAllProducts()=> remoteDataSource.fetchAllProducts();

    @override
    Future<List<CategoryEntity>> fetchAllCategory()=> remoteDataSource.fetchAllCategory();

     @override
    Future<List<ProductEntity>> fetchByCategory(String category)=>remoteDataSource.fetchByCategory(category);

    @override
      Future<ProductEntity> fetchProductByID(String id)=>remoteDataSource.fetchProductByID(id);

}