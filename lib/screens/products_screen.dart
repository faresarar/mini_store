import 'package:flutter/material.dart';

import '../widgets/product_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
      ),
      body: GridView.builder(
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
      ),
    );
  }
}
