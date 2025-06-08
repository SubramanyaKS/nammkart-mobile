import 'package:flutter/material.dart';
import 'package:nammkart/src/features/address/presentation/provider/address_provider.dart';
import 'package:nammkart/src/features/address/presentation/widgets/address_form.dart';
import 'package:nammkart/src/features/auth/presentation/provider/user_provider.dart';
import 'package:nammkart/src/features/home/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final postalcodeController = TextEditingController();
  final countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Text(
            'Add Address',
          ),
        ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text('Add Address',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 30,),
              AddressForm(
                  buttonTitle: 'Add Address',
                  streetController: streetController,
                  cityController: cityController,
                  countryController: countryController,
                  postalcodeController: postalcodeController,
                  stateController: stateController,
                  onPress: () {
                    final userId = Provider.of<UserProvider>(context, listen: false)
                        .users
                        .userId;
                    final addressProvider =
                        Provider.of<AddressProvider>(context, listen: false);
                    final Map<String, dynamic> addressData = {
                      'street': streetController.text,
                      'city': cityController.text,
                      'state': stateController.text,
                      'postalcode': postalcodeController.text,
                      'country': countryController.text,
                    };
                    addressProvider.addAddress(userId, addressData);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
