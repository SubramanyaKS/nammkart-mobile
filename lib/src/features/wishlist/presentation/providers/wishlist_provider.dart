import 'package:flutter/material.dart';
import 'package:nammkart/src/features/wishlist/domain/entities/wishlist.dart';
import 'package:nammkart/src/features/wishlist/domain/repository/wishlist_repository.dart';

class WishlistProvider with ChangeNotifier {
  final WishlistRepository wishlistRepository;

WishlistProvider({required this.wishlistRepository});

WishlistEntity _wishlist=WishlistEntity(items: []);
String _message = '';

WishlistEntity get wishlist => _wishlist;
String get message =>_message;


Future<void> addWishlist(token,wishlist) async {
    var msg=await wishlistRepository.addWishlist(token,wishlist);
    _message=msg;
    notifyListeners();
}

Future<void> getWishlist(token) async {
  var data =await wishlistRepository.getWishlist(token);
  _wishlist=data;
  notifyListeners();
}

Future<void> deleteWishList(token,productId) async{
  var mess= await wishlistRepository.deleteWishListProduct(token, productId);
  _message=mess;
  notifyListeners();
}

}