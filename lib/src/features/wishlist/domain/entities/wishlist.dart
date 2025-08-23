import 'package:nammkart/src/features/wishlist/domain/entities/wishlistentry.dart';

class WishlistEntity {
  final String? userId;
  final List<WishlistEntryEntity> items;

  WishlistEntity({this.userId, required this.items});
}
