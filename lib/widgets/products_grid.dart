import 'package:flutter/material.dart';

import 'product_widget.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        childAspectRatio: 0.6,
        crossAxisSpacing: 0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const ProductWidget();
      },
    );
  }
}
