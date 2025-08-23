import 'package:flutter/material.dart';
import 'package:nammkart/src/features/auth/presentation/provider/user_provider.dart';
import 'package:nammkart/src/features/home/presentation/widgets/carousel_widget.dart';
import 'package:nammkart/src/features/product/presentation/provider/product_provider.dart';
import 'package:nammkart/src/features/product/presentation/screens/product_screen.dart';
import 'package:nammkart/src/features/product/presentation/widgets/category_card.dart';
import 'package:nammkart/src/features/product/presentation/widgets/product_card.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<dynamic> products = [];
  List<dynamic> category = [];
  // bool isLoading = true;
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    final product = provider.getTopProducts();

    final topRated = provider.getTopRatedProducts();

    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Consumer<UserProvider>(
                        builder: (context, userProvider, _) {
                          final username = userProvider.users.username;
                          return Text("Welcome, $username",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30));
                        },
                      ),
                      Spacer(),
                      Icon(Icons.notifications),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SearchBar(
                    leading: const Icon(Icons.search),
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    controller: searchController,
                    hintText: 'Search Product',
                    onChanged: (query) {
                      provider.searchProducts(query);
                    },
                    onSubmitted: (event) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ProductScreen()));
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CarouselWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    'Category',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox(
                          height: 70,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: provider.category.length,
                            itemBuilder: (context, index) {
                              final cate = provider.category[index];
                              return CategoryCard(
                                categoryName: cate.name.toString(),
                                imageUrl: cate.imageUrl!,
                              );
                            },
                          ),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All Products',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ProductScreen()));
                        },
                        child: Text(
                          'see all',
                          style:
                              TextStyle(fontSize: 24, color: Colors.deepPurple),
                        ),
                      ),
                    ],
                  ),
                  _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox(
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: product.length,
                            itemBuilder: (context, index) {
                              final prod = product[index];
                              return Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(12),
                                  // boxShadow: [
                                  // BoxShadow(
                                  // color: Theme.of(context).shadowColor,
                                  // blurRadius: 6,
                                  // ),
                                  // ],
                                ),
                                width: 200,
                                margin: EdgeInsets.only(left: 10),
                                child: ProductCard(
                                    uri: prod.imageUrl,
                                    productName: prod.productName,
                                    price: prod.price.toString(),
                                    rating: prod.rating.toString(),
                                    productID: prod.productID,
                                    discountPrice: prod.discountPrice != null
                                        ? prod.discountPrice.toString()
                                        : prod.price.toString()),
                              );
                            },
                          ),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Rated Products',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ProductScreen()));
                        },
                        child: Text(
                          'see all',
                          style:
                              TextStyle(fontSize: 24, color: Colors.deepPurple),
                        ),
                      ),
                    ],
                  ),
                  _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox(
                          height: 290,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: topRated.length,
                            itemBuilder: (context, index) {
                              final prod = topRated[index];
                              return Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: 200,
                                margin: EdgeInsets.only(left: 10),
                                child: ProductCard(
                                    uri: prod.imageUrl,
                                    productName: prod.productName,
                                    price: prod.price.toString(),
                                    rating: prod.rating.toString(),
                                    productID: prod.productID,
                                    discountPrice: prod.discountPrice != null
                                        ? prod.discountPrice.toString()
                                        : prod.price.toString()),
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        ));
  }
}
