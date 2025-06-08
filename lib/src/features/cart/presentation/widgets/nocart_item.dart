import 'package:flutter/material.dart';

class NocartItem extends StatelessWidget {
  const NocartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart,size: 100,color: Colors.deepPurple,),
              Text("Cart Empty",style: TextStyle(fontSize: 22),),
              Text("You have no items in your shopping cart"),
              Text("Let's go and buy something"),
            ],
          
        ),
      ),
    );
  }
}