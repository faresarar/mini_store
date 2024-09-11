import 'package:flutter/material.dart';
import 'package:mini_store/widgets/products_grid.dart';

import '../models/products_model.dart';
import '../services/api_handler.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<ProductsModel> productsList = [];
  int limit = 10 ;
  bool isLoading = false ;
  bool isLimit = false ;
  @override
  void didChangeDependencies() {
    getProducts();
    super.didChangeDependencies();
  }

  Future<void> getProducts() async {
    productsList = await ApiHandler.getAllProducts(limit: limit.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Products")),
      body: FutureBuilder<List<ProductsModel>>(
        future: ApiHandler.getAllProducts(limit: ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            Center(
              child: Text(
                "An error occurred ${snapshot.error}",
              ),
            );
          } else if (snapshot.data == null) {
            const Center(
              child: Text(
                "No products has been added yet",
              ),
            );
          }
          return ProductsGrid(
            productsList: snapshot.data!,
          );
        },
      ),
    );
  }
}
