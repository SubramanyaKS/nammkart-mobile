import 'package:nammkart/src/features/wishlist/domain/entities/wishlistproduct.dart';

class WishlistProductModel extends WishlistProductEntity {
  WishlistProductModel({required super.id, super.productId, required super.productName, required super.imageUrl});
  
  factory WishlistProductModel.fromJson(Map<String, dynamic> json) {
    return WishlistProductModel(
      id: json['_id'],
      productName: json['productName'],
      imageUrl: json['imageUrl'],
      productId:json['productID'],
    );
  }

}