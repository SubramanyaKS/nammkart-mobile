import 'package:flutter/material.dart';
import 'package:nammkart/src/features/address/presentation/screen/view_address.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedPayment = 'upi';
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
          ],
        ),
      ),
    );
  }
}
