import 'package:flutter/material.dart';

import '../models/models/products_model.dart';
import 'product_widget.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key, required this.productsList});
  final List<ProductsModel> productsList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productsList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        childAspectRatio: 0.6,
        crossAxisSpacing: 0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ProductWidget(
          title: productsList[index].title.toString(),
          imageUrl: productsList[index].images![0],
        );
      },
    );
  }
}
