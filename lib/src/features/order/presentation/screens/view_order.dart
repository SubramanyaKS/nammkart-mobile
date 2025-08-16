import 'package:flutter/material.dart';
import 'package:nammkart/src/features/auth/presentation/provider/user_provider.dart';
import 'package:nammkart/src/features/order/domain/entities/order.dart';
import 'package:nammkart/src/features/order/presentation/providers/order_provider.dart';
import 'package:nammkart/src/features/order/presentation/widgets/order_items_list.dart';
import 'package:nammkart/src/features/order/presentation/widgets/order_summary.dart';
import 'package:nammkart/src/features/order/presentation/widgets/shipping_address.dart';
import 'package:provider/provider.dart';

class ViewOrder extends StatefulWidget {
  final String orderId;
  const ViewOrder({super.key, required this.orderId});

  @override
  State<ViewOrder> createState() => _ViewOrderState();
}

class _ViewOrderState extends State<ViewOrder> {
  @override
  Widget build(BuildContext context) {
    // print(widget.orderId);
     final token=Provider.of<UserProvider>(context,listen:false).authenticate;
    final orderProvider = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('View Order Details'),
      ),
      body:SingleChildScrollView(
        child:  FutureBuilder<OrderEntity>(
            future: orderProvider.getOrderById(token,widget.orderId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData) {
                return Center(child: Text("Product not found"));
              }
        
              final order = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderSummary(order: order),
                    ShippingAddress(order: order),
                    OrderItemsList(order: order),
                    

                    // Text(order.shippingAddress.toString()),
                ],
                ),
              );
            }
              )
      )
    );
  }
}
