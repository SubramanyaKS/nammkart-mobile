import 'package:nammkart/src/features/wishlist/domain/entities/wishlistproduct.dart';

class WishlistEntryEntity {
  final String? id;
  final DateTime? addedAt;
  final WishlistProductEntity product;

  WishlistEntryEntity({this.id, this.addedAt, required this.product});
}
