import 'package:flutter/material.dart';
import 'package:nammkart/src/config/common/custom_button.dart';
import 'package:nammkart/src/features/home/presentation/screens/home_screen.dart';

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 100,
            color: Colors.greenAccent,
          ),
          Text(
            "Order Placed Successful!",
            style: TextStyle(fontSize: 25, color: Colors.deepPurple),
          ),
          Text("Thank you for ordering", style: TextStyle(fontSize: 20)),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
                title: 'Continue Shopping',
                onPress: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomeScreen()));
                }),
          ),
        ],
      ),
    );
  }
}
