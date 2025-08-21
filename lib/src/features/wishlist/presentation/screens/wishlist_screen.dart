import 'package:flutter/material.dart';
import 'package:nammkart/src/features/wishlist/presentation/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:nammkart/src/config/common/dialog_box.dart';
import 'package:nammkart/src/features/auth/presentation/provider/user_provider.dart';
import 'package:nammkart/src/features/product/presentation/screens/single_product_screen.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final token =
          Provider.of<UserProvider>(context, listen: false).authenticate;

      await Provider.of<WishlistProvider>(context, listen: false)
          .getWishlist(token);

      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final wishlist=wishlistProvider.wishlist;
    final token=Provider.of<UserProvider>(context,listen:false).authenticate;
    return Scaffold(
      appBar: AppBar(title: Text('Wishlist'),),
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : wishlist.items.isEmpty
            ? const Center(child: Text('No Product in Wishlist.'))
            : ListView.builder(
          itemCount: wishlist.items.length,
          itemBuilder: (context, index) {
            final wishlistItem = wishlist.items[index];
            return Card(
              color: Theme.of(context).cardColor,
              margin:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: Image.network(wishlistItem.product.imageUrl),
                title: Text(
                  'Product ${wishlistItem.product.productName}',
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onTap: (){
                //   move to single product screen
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SingleProductScreen(productID: wishlistItem.product.productId!)));

                },
                trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    ),
                    onPressed: () => {
                      showCustomAlert(
                        context,
                        title: 'Confirm',
                        content:
                        'Do you want to delete item from wishlist?',
                        action1Text: 'Cancel',
                        onAction1: () => Navigator.pop(context),
                        action2Text: 'Yes',
                        onAction2: () async{
                          Navigator.pop(context);
                          await wishlistProvider.deleteWishList(token, {"productId":wishlistItem.product.id});
                          await  Provider.of<WishlistProvider>(context, listen: false).getWishlist(token);
                          },
                      ),
                    }),
              ),
            );
          },
        ),
      )
    );
  }
}