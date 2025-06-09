import 'package:flutter/material.dart';
import 'package:nammkart/src/features/address/presentation/provider/address_provider.dart';
import 'package:nammkart/src/features/auth/presentation/provider/user_provider.dart';
import 'package:nammkart/src/features/home/presentation/screens/home_screen.dart';
import 'package:nammkart/src/features/product/presentation/provider/product_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  Future<void> initializeApp() async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final productProvider = Provider.of<ProductProvider>(context, listen: false);
      final addressProvider = Provider.of<AddressProvider>(context,listen:false);

      await userProvider.userByEmail();
      await productProvider.fetchProducts();
      await productProvider.fetchCategory();
      await addressProvider.getAddress(userProvider.users.userId);

       Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } catch (e) {
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
