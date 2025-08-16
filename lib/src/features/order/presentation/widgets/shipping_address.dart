import 'package:flutter/material.dart';
import 'package:nammkart/src/features/order/domain/entities/order.dart';

class ShippingAddress extends StatelessWidget {
  final OrderEntity order;
  const ShippingAddress({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 2.0,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.home),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Shipping Address",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(order.shippingAddress.street.toString(),
                style: TextStyle(fontSize: 18)),
            Text(order.shippingAddress.city.toString(),
                style: TextStyle(fontSize: 18)),
            Text(order.shippingAddress.state.toString(),
                style: TextStyle(fontSize: 18)),
            Text(order.shippingAddress.country.toString(),
                style: TextStyle(fontSize: 18)),
            Text(order.shippingAddress.postalcode.toString(),
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
