import 'package:flutter/material.dart';
import 'package:nammkart/src/config/common/custom_button.dart';

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check_circle_outline,size: 100,color: Colors.deepPurple,),
        Text("Order Placed Successful!",style: TextStyle(fontSize: 30,color: Colors.deepPurple),),
        SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(title: 'Continue Shopping', onPress: (){}),
        ),
      ],
    );
  }
}
