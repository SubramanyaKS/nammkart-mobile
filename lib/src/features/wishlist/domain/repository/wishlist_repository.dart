import 'package:nammkart/src/features/wishlist/domain/entities/wishlist.dart';

abstract class WishlistRepository {
  Future<String> addWishlist(token,productID);
  Future<WishlistEntity> getWishlist(token);
  Future<String> deleteWishListProduct(token,productId);
}