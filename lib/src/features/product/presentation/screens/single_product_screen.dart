import 'package:flutter/material.dart';
import 'package:nammkart/src/features/cart/presentation/provider/cart_provider.dart';
import 'package:nammkart/src/features/product/domain/entities/product.dart';
import 'package:nammkart/src/features/product/presentation/provider/product_provider.dart';
import 'package:nammkart/src/features/product/presentation/widgets/rating_star.dart';
import 'package:provider/provider.dart';

class SingleProductScreen extends StatefulWidget {
  final String productID;
  const SingleProductScreen({super.key, required this.productID});

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context,listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<ProductEntity>(
            future: productProvider.fetchSingleProduct(widget.productID),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData) {
                return Center(child: Text("Product not found"));
              }
        
              final product = snapshot.data!;
              return Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(product.imageUrl,width: 400,height: 400,fit: BoxFit.cover,),
                    Text(product.category, style: TextStyle(color: Colors.purpleAccent,fontSize: 20,fontWeight: FontWeight.bold),),
                    Text(product.productName, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    Text("Brand: \$${product.brand}"),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        RatingStar(rating: product.rating, size: 24),
                        Text(product.rating.toString(),style: TextStyle(fontSize: 20),),
                      ],
                    ),

                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('₹${product.price}', style: TextStyle(fontSize: 30,decoration: TextDecoration.lineThrough, color: Colors.red, fontWeight: FontWeight.bold)),
                        Text('₹${product.discountPrice??product.price}', style: TextStyle(fontSize: 30, color: Colors.green, fontWeight: FontWeight.bold)),
                      ],

                    ),
                    SizedBox(height: 20),
                    Text(product.description,style: TextStyle(fontSize: 20)),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        cartProvider.addToCart(product.productID);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.productName} added to cart!'),
                            // action: SnackBarAction(
                            //   label: 'Go to Cart',
                            //   onPressed: () {
                            //     Navigator.pushNamed(context, '/cart');
                            //   },
                            // ),
                          ),
                        );
                        // Navigate to Login or Signup
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 18,color: Colors.white),
                      ),
                    ),

                   // Add more fields as needed
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
