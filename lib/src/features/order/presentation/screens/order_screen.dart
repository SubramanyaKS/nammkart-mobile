import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nammkart/src/features/auth/presentation/provider/user_provider.dart';
import 'package:nammkart/src/features/order/presentation/providers/order_provider.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    // Delay execution until widget is mounted
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final token =
          Provider.of<UserProvider>(context, listen: false).authenticate;

      await Provider.of<OrderProvider>(context, listen: false)
          .getAllOrder(token);

      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders')),
      body: SafeArea(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : order.orders.isEmpty
              ? const Center(child: Text('No orders found.'))
              : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: order.orders.length,
              itemBuilder: (context, index) {
                final orderItem = order.orders[index];
                return Card(
                  color: Theme.of(context).cardColor,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      'order ${orderItem.orderId}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(orderItem.totalPrice.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(DateFormat("yyyy-MM-dd").format(orderItem.orderedAt!))
                    ],
                  ),
                  ),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
