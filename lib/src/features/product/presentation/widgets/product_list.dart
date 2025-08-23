import 'package:flutter/material.dart';
import 'package:nammkart/src/features/product/domain/entities/product.dart';
import 'package:nammkart/src/features/product/presentation/widgets/product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 230,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemCount: products.length,
      itemBuilder: (ctx, i) {
        final product = products[i];
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          width: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: ProductCard(
              uri: product.imageUrl,
              productName: product.productName,
              price: product.price.toString(),
              rating: product.rating.toString(),
              productID: product.productID,
              discountPrice: product.discountPrice != null
                  ? product.discountPrice.toString()
                  : product.price.toString()),
        );
      },
    );
  }
}
