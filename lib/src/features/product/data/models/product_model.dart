import 'package:nammkart/src/features/product/domain/entities/product.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.productID,
    required super.productName,
    required super.description,
    required super.price,
    required super.category,
    super.brand,
    required super.quantity,
    required super.rating,
    required super.isAvailable,
    required super.imageUrl,
    super.seller,
    super.discountPrice,
    super.isDiscount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productID: json['productID'],
      productName: json['productName'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      category: json['category'],
      brand: json['brand'],
      quantity: json['quantity'],
      rating: (json['rating'] as num).toDouble(),
      isAvailable: json['isAvailable'],
      imageUrl: json['imageUrl'],
      isDiscount: json['isDiscount'],
      seller: json['seller'],
      discountPrice: json['discountPrice'] != null
          ? (json['discountPrice'] as num).toDouble()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productID': productID,
      'productName': productName,
      'description': description,
      'price': price,
      'category': category,
      'brand': brand,
      'quantity': quantity,
      'rating': rating,
      'isAvailable': isAvailable,
      'imageUrl': imageUrl,
      'isDiscount': isDiscount,
      'seller': seller,
      'discountPrice': discountPrice,
    };
  }
}
