import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../constants/global_colors.dart';
import '../models/products_model.dart';
import '../services/api_handler.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.id});
  final String id;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final titleStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  ProductsModel? productsModel;
  bool isError = false;
  String errorString = "";
  Future<void> getProductInfo() async {
    try {
      productsModel = await ApiHandler.getProductById(id: widget.id);
    } catch (error) {
      isError = true ;
      errorString = error.toString();
      log("An error occurred $error" as num);
    }
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    getProductInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isError
        ?  Center(
            child: Text(
              "An error occurred$errorString",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 18),
                const BackButton(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productsModel!.category.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Text(
                              productsModel!.title!,
                              textAlign: TextAlign.start,
                              style: titleStyle,
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: RichText(
                              text: TextSpan(
                                text: '\$',
                                style: const TextStyle(
                                    fontSize: 25,
                                    color: Color.fromRGBO(33, 150, 243, 1)),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: productsModel!.price!.toString(),
                                    style: TextStyle(
                                      color: lightTextColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.4,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return FancyShimmerImage(
                        width: double.infinity,
                        imageUrl: productsModel!.images![index].toString(),
                        boxFit: BoxFit.fill,
                      );
                    },

                    autoplay: true,
                    itemCount: 3,
                    pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                        color: Colors.white,
                        activeColor: Colors.red,
                      ),
                    ),
                    // control: const SwiperControl(),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description', style: titleStyle),
                      const SizedBox(height: 18),
                      Text(
                        productsModel!.description!,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
