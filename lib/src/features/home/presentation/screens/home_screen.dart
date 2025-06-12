import 'package:flutter/material.dart';
import 'package:nammkart/src/features/auth/presentation/screens/profile_screen.dart';
import 'package:nammkart/src/features/cart/presentation/screens/cart_screen.dart';
import 'package:nammkart/src/features/home/presentation/screens/main_screen.dart';
import 'package:nammkart/src/features/order/presentation/screens/order_placed.dart';
import 'package:nammkart/src/features/order/presentation/screens/order_screen.dart';
import 'package:nammkart/src/features/settings/presentation/screens/settings_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    MainScreen(),
    CartScreen(),
    SettingsScreen(),
    ProfileScreen(),
    OrderScreen(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text(
      //     'NammKart',
      //   ),
      // ),
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Order',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
