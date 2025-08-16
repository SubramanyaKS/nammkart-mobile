import 'package:flutter/material.dart';
import 'package:nammkart/src/features/order/domain/entities/order.dart';

class OrderItemsList extends StatelessWidget {
  final OrderEntity order;

  const OrderItemsList({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // Rounded corners
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.shopping_bag),
                                SizedBox(width: 15,),
                                Text(
                                  "Order Items",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),

                              ],
                            ),

                            SizedBox(height: 8),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: order.orderItems.length,
                              itemBuilder: (context, index) {
                                var item = order.orderItems[index];
                                var total = item.price * item.quantity;
                                return ListTile(
                                  tileColor: Colors.grey.shade200,
                                  leading: const Icon(Icons.view_in_ar_sharp),
                                  title: Text(item.name, style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                  subtitle: Text("₹${item.price} x ${item.quantity}"),
                                  trailing: Text("₹${total.toStringAsFixed(2)}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                );
                              },
                              separatorBuilder: (context, index) => const Divider(),
                            ),
                          ],
                        ),
                      ),
                    );
  }
}