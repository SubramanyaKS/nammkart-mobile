import 'package:flutter/material.dart';
import 'package:nammkart/src/config/environment/environment.dart';
import 'package:nammkart/src/features/address/data/datasource/address_remote_datasource.dart';
import 'package:nammkart/src/features/address/data/repository/address_repository_imp.dart';
import 'package:nammkart/src/features/address/presentation/provider/address_provider.dart';
import 'package:nammkart/src/features/auth/data/datasource/user_remote_datasource.dart';
import 'package:nammkart/src/features/auth/data/repository/user_repository_imp.dart';
import 'package:nammkart/src/features/auth/presentation/provider/user_provider.dart';
import 'package:nammkart/src/features/cart/presentation/provider/cart_provider.dart';
import 'package:nammkart/src/features/order/data/datasource/order_remote_datasource.dart';
import 'package:nammkart/src/features/order/data/repository/order_repository_imp.dart';
import 'package:nammkart/src/features/order/presentation/providers/order_provider.dart';
import 'package:nammkart/src/features/product/data/datasource/product_remote_datasource.dart';
import 'package:nammkart/src/features/product/data/repository/product_repository_imp.dart';
import 'package:nammkart/src/features/product/presentation/provider/product_provider.dart';
import 'package:nammkart/src/config/theme/provider/theme_provider.dart';
import 'package:nammkart/src/config/theme/util/theme.dart';
import 'package:nammkart/src/features/wishlist/data/datasource/wishlist_remote_datasource.dart';
import 'package:nammkart/src/features/wishlist/data/repository/wishlistlist_repository_impl.dart';
import 'package:nammkart/src/features/wishlist/presentation/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:nammkart/src/features/home/presentation/screens/welcome_screen.dart';

void main() async {
  await Environment.load();
  // WidgetsFlutterBinding.ensureInitialized();
  final productRepository = ProductRepositoryImp(ProductRemoteDatasource());
  final userRepository = UserRepositoryImp(UserRemoteDatasource());
  final addressRepository = AddressRepositoryImp(AddressRemoteDatasource());
  final orderRepository = OrderRepositoryImp(OrderRemoteDatasource());
  final wishlistRepository = WishlistRepositoryImpl(WishlistRemoteDatasource());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
            create: (_) => AddressProvider(addressRepository)),
        ChangeNotifierProvider(
            create: (_) => ProductProvider(repository: productRepository)),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider(userRepository)),
        ChangeNotifierProvider(
            create: (_) => OrderProvider(orderRepository: orderRepository)),
        ChangeNotifierProvider(
            create: (_) =>
                WishlistProvider(wishlistRepository: wishlistRepository))
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NammKart',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      home: const WelcomeScreen(),
    );
  }
}
