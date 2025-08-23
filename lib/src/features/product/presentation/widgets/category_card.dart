import 'package:flutter/material.dart';
import 'package:nammkart/src/features/product/presentation/provider/product_provider.dart';
import 'package:nammkart/src/features/product/presentation/screens/product_screen.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key, required this.categoryName, required this.imageUrl});

  final String categoryName;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return InkWell(
      splashColor: Colors.deepPurple,
      onTap: () {
        provider.searchProductsByCategory(categoryName);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const ProductScreen()));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Image.network(
              imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
