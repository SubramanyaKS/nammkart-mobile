import 'package:nammkart/src/features/wishlist/data/datasource/wishlist_remote_datasource.dart';
import 'package:nammkart/src/features/wishlist/domain/entities/wishlist.dart';
import 'package:nammkart/src/features/wishlist/domain/repository/wishlist_repository.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistRemoteDatasource wishlistRemoteDatasource;

  WishlistRepositoryImpl(this.wishlistRemoteDatasource);

  @override
  Future<String> addWishlist(token, productID) =>
      wishlistRemoteDatasource.addWishlist(token, productID);

  @override
  Future<WishlistEntity> getWishlist(token) =>
      wishlistRemoteDatasource.getWishlist(token);

  @override
  Future<String> deleteWishListProduct(token, productId) =>
      wishlistRemoteDatasource.deleteWishlist(token, productId);
}
