import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Products")),
      body: const ProductsGrid(),
    );
  }
}
