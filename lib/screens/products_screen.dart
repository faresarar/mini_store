import 'package:flutter/material.dart';

import '../models/models/products_model.dart';
import '../services/api_handler.dart';
import '../widgets/products_grid.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<ProductsModel> productsList = [];
  @override
  void didChangeDependencies() {
    getProducts();
    super.didChangeDependencies();
  }

  Future<void> getProducts() async {
    productsList = await ApiHandler.getAllProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Products")),
      body: productsList.isEmpty
          ? Container()
          : ProductsGrid(
              productsList: productsList,
            ),
    );
  }
}
