import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products_model.dart';
import 'product_widget.dart';

class ProductsGrid extends StatefulWidget {
  const ProductsGrid({super.key, required this.productsList});
  final List<ProductsModel> productsList;

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
   ScrollController scrollController  = ScrollController();
   @override
  void didChangeDependencies() {
     scrollController.addListener(()async{
       if(scrollController.position.pixels == scrollController.position.maxScrollExtent) {}
     });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.productsList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        childAspectRatio: 0.6,
        crossAxisSpacing: 0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ChangeNotifierProvider.value(
          value: widget.productsList[index],
          child: const ProductWidget(),
        );
      },
    );
  }
}
