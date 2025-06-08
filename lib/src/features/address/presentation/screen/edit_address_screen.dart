import 'package:flutter/material.dart';
import 'package:nammkart/src/features/address/presentation/provider/address_provider.dart';
import 'package:nammkart/src/features/address/presentation/widgets/address_form.dart';
import 'package:nammkart/src/features/auth/presentation/provider/user_provider.dart';
import 'package:provider/provider.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({super.key});

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final postalcodeController = TextEditingController();
  final countryController = TextEditingController();


  @override
  Widget build(BuildContext context) {
     final address = Provider.of<AddressProvider>(context,listen: false).address;
     cityController.text=address.city!;
     streetController.text=address.street!;
    stateController.text=address.state;
    countryController.text=address.country;
    postalcodeController.text=address.postalcode;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Edit Address',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
              AddressForm(buttonTitle: 'Edit Address', streetController: streetController, cityController: cityController, countryController: countryController, postalcodeController: postalcodeController, stateController: stateController, onPress: (){
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
              addressProvider.updateAddress(userId, addressData);
              Navigator.pop(context);
          
          }
          ),
            ],
          ),
        ),
      )
    );
  }
}
