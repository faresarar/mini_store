import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:page_transition/page_transition.dart';

import '../models/products_model.dart';
import '../services/api_handler.dart';
import '../widgets/custom_icon.dart';
import '../widgets/products_grid.dart';
import '../widgets/sale_widget.dart';
import 'categories_screen.dart';
import 'products_screen.dart';
import 'users_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController textEditingController;
  List<ProductsModel> productsList = [];
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose;
    super.dispose();
  }

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
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          leading: CustomIcon(
            function: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const CategoriesScreen(),
                  type: PageTransitionType.fade,
                ),
              );
            },
            icon: IconlyBold.category,
          ),
          actions: [
            CustomIcon(
              function: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const UsersScreen(),
                    type: PageTransitionType.fade,
                  ),
                );
              },
              icon: IconlyBold.user3,
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 18,
                  ),
                  TextField(
                    controller: textEditingController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: "Search",
                      suffixIcon: Icon(IconlyLight.search),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.25,
                            child: Swiper(
                              itemCount: 3,
                              control: const SwiperControl(),
                              itemBuilder: (context, index) {
                                return const SaleWidget();
                              },
                              pagination: const SwiperPagination(
                                alignment: Alignment.bottomCenter,
                                builder: DotSwiperPaginationBuilder(
                                  activeColor: Colors.red,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text("Latest Product"),
                                const Spacer(),
                                CustomIcon(
                                  function: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: const ProductsScreen(),
                                        type: PageTransitionType.fade,
                                      ),
                                    );
                                  },
                                  icon: IconlyBold.arrowRight2,
                                )
                              ],
                            ),
                          ),
                          FutureBuilder<List<ProductsModel>>(
                            future: ApiHandler.getAllProducts(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                Center(
                                  child: Text(
                                    "An error occurred ${snapshot.error}",
                                  ),
                                );
                              }
                              else if (snapshot.data ==  null ) {
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
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
