import 'package:flutter/material.dart';
import 'package:nammkart/src/features/order/domain/entities/order.dart';

class OrderSummary extends StatelessWidget {
  final OrderEntity order;

  const OrderSummary({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 2.0,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.delivery_dining),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Order Summary",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text("Order ID:  ${order.orderId}",
                  style: TextStyle(fontSize: 18)),
              Text("Ordered At:  ${order.orderedAt.toString()}",
                  style: TextStyle(fontSize: 18)),
              Text("Status:  ${order.status}", style: TextStyle(fontSize: 18)),
              Text("Payment Method:   ${order.paymentMethod}",
                  style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
