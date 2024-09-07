import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:card_swiper/card_swiper.dart';

import '../widgets/custom_icon.dart';
import '../widgets/product_widget.dart';
import '../widgets/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController textEditingController;
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
            function: () {},
            icon: IconlyBold.category,
          ),
          actions: [
            CustomIcon(
              function: () {},
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
                          GridView.builder(
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
                          )
                    
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
