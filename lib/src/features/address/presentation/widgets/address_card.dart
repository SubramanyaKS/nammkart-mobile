import 'package:flutter/material.dart';
import 'package:nammkart/src/features/address/presentation/screen/edit_address_screen.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key, required this.street, required this.city, required this.state, required this.country, required this.postalCode});

  final String street;
  final String city;
  final String state;
  final String country;
  final String postalCode;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.deepPurple),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '$street\n$city, $state\n$country - $postalCode',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                  iconSize: 30,
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const EditAddress()));


                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}