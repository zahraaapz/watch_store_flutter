import 'package:flutter/material.dart';
import 'package:watch_store_flutter/widget/product_item.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 0.7,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return productItem(productName: 'productName', price: 100);
        },
      ),
    );
  }
}