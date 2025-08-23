import 'package:nammkart/src/features/wishlist/data/models/wishlistentry_model.dart';
import 'package:nammkart/src/features/wishlist/domain/entities/wishlist.dart';

class WishlistModel extends WishlistEntity {
  WishlistModel({required super.items, super.userId});

  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    return WishlistModel(
      userId: json['userId'],
      items: (json['items'] as List)
          .map((item) => WishlistEntryModel.fromJson(item))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'items': items.map((e) => (e as WishlistEntryModel).toJson()).toList(),
    };
  }
}
