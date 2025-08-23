import 'package:flutter/material.dart';
import 'package:nammkart/src/config/common/custom_button.dart';

class AddressForm extends StatelessWidget {
  const AddressForm(
      {super.key,
      required this.buttonTitle,
      required this.streetController,
      required this.cityController,
      required this.countryController,
      required this.postalcodeController,
      required this.stateController,
      required this.onPress});
  final String buttonTitle;
  final TextEditingController streetController;
  final TextEditingController cityController;
  final TextEditingController countryController;
  final TextEditingController postalcodeController;
  final TextEditingController stateController;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: streetController,
                decoration: const InputDecoration(
                  labelText: 'Street',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: cityController,
                decoration: const InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: stateController,
                decoration: const InputDecoration(
                  labelText: 'State',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: postalcodeController,
                decoration: const InputDecoration(
                  labelText: 'Pincode',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: countryController,
                decoration: const InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                title: buttonTitle,
                onPress: onPress,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
