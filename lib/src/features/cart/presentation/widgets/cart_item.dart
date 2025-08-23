import 'package:flutter/material.dart';
import 'package:nammkart/src/config/common/dialog_box.dart';
import 'package:nammkart/src/features/cart/presentation/provider/cart_provider.dart';
import 'package:nammkart/src/features/product/presentation/provider/product_provider.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cart,
    required this.productCache,
  });

  final CartProvider cart;
  final ProductProvider productCache;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final cartItem = cart.items[index];

          return FutureBuilder(
            future: productCache.fetchSingleProduct(cartItem.productId),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final product = snapshot.data!;
              return Card(
                color: Theme.of(context).cardColor,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: Image.network(product.imageUrl, width: 60),
                  title: Text(
                    product.productName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "₹${product.isDiscount! ? product.discountPrice : product.price}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => {
                                cart.decreaseQuantity(product.productID),
                                cart.getTotalPriceAsync(productCache.products),
                              }),
                      Text('${cartItem.quantity}'),
                      IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => {
                                cart.increaseQuantity(product.productID),
                                cart.getTotalPriceAsync(productCache.products),
                              }),
                      IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          ),
                          onPressed: () => {
                                showCustomAlert(
                                  context,
                                  title: 'Confirm',
                                  content:
                                      'Do you want to delete item from cart?',
                                  action1Text: 'Cancel',
                                  onAction1: () => Navigator.pop(context),
                                  action2Text: 'Yes',
                                  onAction2: () {
                                    Navigator.pop(context);
                                    cart.removeFromCart(product.productID);
                                    cart.getTotalPriceAsync(
                                        productCache.products);
                                    // Your action here
                                  },
                                ),
                              })
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
