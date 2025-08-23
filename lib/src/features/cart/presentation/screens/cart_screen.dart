import 'package:flutter/material.dart';
import 'package:nammkart/src/config/common/custom_button.dart';
import 'package:nammkart/src/features/cart/presentation/widgets/nocart_item.dart';
import 'package:nammkart/src/features/order/presentation/screens/checkout_screen.dart';
import 'package:nammkart/src/features/cart/presentation/provider/cart_provider.dart';
import 'package:nammkart/src/features/cart/presentation/widgets/cart_item.dart';
import 'package:nammkart/src/features/product/presentation/provider/product_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final cart = Provider.of<CartProvider>(context, listen: false);
        final productCache =
            Provider.of<ProductProvider>(context, listen: false);
        cart.getTotalPriceAsync(productCache.products);
      });
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final productCache = Provider.of<ProductProvider>(context);
    final totalPrice = context.watch<CartProvider>().totalPrice;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Column(children: [
        cart.items.isEmpty
            ? NocartItem()
            : CartItem(cart: cart, productCache: productCache),
        Spacer(),
        Container(
          decoration: BoxDecoration(
              // color: Colors.white,
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade600,
                    spreadRadius: 1,
                    blurRadius: 15)
              ]),
          width: 500,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total:",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₹${totalPrice.toString()}",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                  title: 'Checkout',
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CheckoutScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
