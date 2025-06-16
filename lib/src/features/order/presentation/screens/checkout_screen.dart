import 'package:flutter/material.dart';
import 'package:nammkart/src/config/common/custom_button.dart';
import 'package:nammkart/src/features/address/presentation/provider/address_provider.dart';
import 'package:nammkart/src/features/address/presentation/widgets/view_address.dart';
import 'package:nammkart/src/features/auth/presentation/provider/user_provider.dart';
import 'package:nammkart/src/features/cart/domain/entities/cart.dart';
import 'package:nammkart/src/features/cart/presentation/provider/cart_provider.dart';
import 'package:nammkart/src/features/order/presentation/providers/order_provider.dart';
import 'package:nammkart/src/features/order/presentation/screens/order_placed.dart';
import 'package:nammkart/src/features/product/domain/entities/product.dart';
import 'package:nammkart/src/features/product/presentation/provider/product_provider.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedPayment = 'upi';

   List<Map<String, dynamic>> buildOrderItems(
  List<CartEntity> cartItems,
  List<ProductEntity> products,
) {
  List<Map<String, dynamic>> orderItems = [];

  for (var cartItem in cartItems) {
    final product = products.firstWhere(
      (prod) => prod.productID == cartItem.productId,
    );

    if (product.productID != '') {
      orderItems.add({
        "productId": product.productID,
        "name": product.productName,
        "image": product.imageUrl,
        "price": product.price,
        "quantity": cartItem.quantity,
      });
    }
  }

  return orderItems;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Shipping Address',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ViewAddress(),
            const Text(
              'Payment Mode',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Radio<String>(
                value: 'upi',
                groupValue: _selectedPayment,
                onChanged: (value) {
                  setState(() {
                    _selectedPayment = value!;
                  });
                },
              ),
              title: const Text('UPI'),
            ),
            ListTile(
              leading: Radio<String>(
                value: 'card',
                groupValue: _selectedPayment,
                onChanged: (value) {
                  setState(() {
                    _selectedPayment = value!;
                  });
                },
              ),
              title: const Text('Card'),
            ),
            ListTile(
              leading: Radio<String>(
                value: 'cash',
                groupValue: _selectedPayment,
                onChanged: (value) {
                  setState(() {
                    _selectedPayment = value!;
                  });
                },
              ),
              title: const Text('Cash on Delivery'),
            ),

            CustomButton(title: 'Order Now', onPress: () async{
              final cart = Provider.of<CartProvider>(context, listen: false);
              final orderProvider=Provider.of<OrderProvider>(context, listen: false);
              final totalPrice=cart.totalPrice;
              final token=Provider.of<UserProvider>(context,listen:false).authenticate;
              final products = Provider.of<ProductProvider>(context, listen: false).products;
              final address = Provider.of<AddressProvider>(context,listen: false).address;
              var orderItems= buildOrderItems(cart.items, products);
              Map<String,dynamic> order = {
                "orderItems":orderItems,
                "totalPrice":totalPrice,
                "shippingAddress":address,
                "paymentMethod":_selectedPayment,
              };
              await orderProvider.addOrder(token,order);
               Navigator.push(context,
                          MaterialPageRoute(builder: (_) => OrderPlaced()));
                   

            })
          ],
        ),
      ),
    );
  }
}
