import 'package:flutter/material.dart';
import 'package:nammkart/src/features/cart/presentation/provider/cart_provider.dart';
import 'package:nammkart/src/features/product/presentation/screens/single_product_screen.dart';
import 'package:nammkart/src/features/product/presentation/widgets/rating_star.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.uri, required this.productName, required this.price, required this.discountPrice, required this.rating, required this.productID});

  final String uri;
  final String productName;
  final String price;
  final String discountPrice;
  final String rating;
  final String productID;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context,listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(uri,width: 100,height: 100,fit: BoxFit.cover,),
          Text(productName,maxLines: 2,
            overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          // Text(rating,style: TextStyle(fontSize: 16,color: Colors.deepPurple),),
          RatingStar(rating: double.parse(rating), size: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text('₹$price',style: TextStyle(fontSize: 18, fontWeight:FontWeight.bold,color: Colors.red,decoration: TextDecoration.lineThrough),),
            Text('₹$discountPrice',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color:Colors.green),),

          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  cartProvider.addToCart(productID);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$productName added to the cart'),
                    ),
                  );
                  // Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                  backgroundColor: Colors.deepPurple, // Button color
                  foregroundColor: Colors.red, // Splash color
                ),
                child: Icon(Icons.add_shopping_cart, color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SingleProductScreen(productID: productID)));

                },
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shadowColor: Colors.green,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                  backgroundColor: Colors.deepPurple, // Button color
                  foregroundColor: Colors.red, // Splash color
                ),
                child: Icon(Icons.remove_red_eye, color: Colors.white),
              )

            ],
          ),

        ],
      ),
    );
  }
}
