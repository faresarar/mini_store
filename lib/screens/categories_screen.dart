import 'package:flutter/material.dart';

import '../models/models/categories_model.dart';
import '../services/api_handler.dart';
import '../widgets/categories_grid.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      body: FutureBuilder<List<CategoryModel>>(
        future: ApiHandler.getAllCategories(),
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
          return CategoriesGrid(
            categoriesList: snapshot.data!,
          );
        },
      ),
    );
  }
}
