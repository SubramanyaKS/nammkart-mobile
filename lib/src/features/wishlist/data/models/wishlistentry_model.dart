import 'package:nammkart/src/features/wishlist/data/models/wishlistproduct_model.dart';
import 'package:nammkart/src/features/wishlist/domain/entities/wishlistentry.dart';

class WishlistEntryModel extends WishlistEntryEntity {
  WishlistEntryModel({required super.product, super.addedAt, super.id});

  factory WishlistEntryModel.fromJson(Map<String, dynamic> json) {
    return WishlistEntryModel(
      product: WishlistProductModel.fromJson(json['product']),
      addedAt: json['addedAt'] != null ? DateTime.parse(json['addedAt']) : null,
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'addedAt': addedAt?.toIso8601String(),
    };
  }
}
