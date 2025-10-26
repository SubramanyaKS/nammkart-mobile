import 'package:flutter/material.dart';
import 'package:nammkart/src/features/cart/presentation/provider/cart_provider.dart';
import 'package:nammkart/src/features/product/presentation/screens/single_product_screen.dart';
import 'package:nammkart/src/features/product/presentation/widgets/animated_icon_button.dart';
import 'package:nammkart/src/features/product/presentation/widgets/rating_star.dart';
import 'package:nammkart/src/features/wishlist/presentation/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:nammkart/src/features/auth/presentation/provider/user_provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.uri,
      required this.productName,
      required this.price,
      required this.discountPrice,
      required this.rating,
      required this.productID});

  final String uri;
  final String productName;
  final String price;
  final String discountPrice;
  final String rating;
  final String productID;

  @override
  Widget build(BuildContext context) {
    final wishlistProvider =
        Provider.of<WishlistProvider>(context, listen: false);
    final token =
        Provider.of<UserProvider>(context, listen: false).authenticate;
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            uri,
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
          Text(
            productName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          RatingStar(rating: double.parse(rating), size: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '₹$price',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough),
              ),
              Text(
                '₹$discountPrice',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimatedIconButton(
                onAdd: () {
                  cartProvider.addToCart(productID);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$productName added to the cart'),
                    ),
                  );
                },
               
                iconData:Icons.add_shopping_cart,
              ),
              AnimatedIconButton(
                onAdd: () async {
                  await wishlistProvider
                      .addWishlist(token, {"productId": productID});
                      ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Product added to the Wishlist'),
                    ),
                  );
                },
                
                iconData: Icons.favorite,
              ),
              AnimatedIconButton(
                onAdd: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              SingleProductScreen(productID: productID)));
                },
               
                iconData: Icons.remove_red_eye,
              )
            ],
          ),
        ],
      ),
    );
  }
}
