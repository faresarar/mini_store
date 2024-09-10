import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/categories_model.dart';
import 'category_widget.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key, required this.categoriesList});
  final List<CategoryModel> categoriesList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value: categoriesList[0],
          child: const CategoryWidget(),
        );
      },
    );
  }
}
