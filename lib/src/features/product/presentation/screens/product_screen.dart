import 'package:flutter/material.dart';
import 'package:nammkart/src/features/product/presentation/provider/product_provider.dart';
import 'package:nammkart/src/features/product/presentation/widgets/product_list.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(title: Text('Products')),
        body: productProvider.filteredProducts.isNotEmpty
            ? ProductList(products: productProvider.filteredProducts)
            : productProvider.products.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ProductList(products: productProvider.products));
  }
}
