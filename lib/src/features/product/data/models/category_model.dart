import 'package:nammkart/src/features/product/domain/entities/category.dart';

class CategoryModel extends CategoryEntity {

  CategoryModel({
    required super.name,
    required super.description,
    super.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'imageUrl':imageUrl,
    };
  }
}