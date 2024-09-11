import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../models/categories_model.dart';
import '../models/products_model.dart';
import '../models/user_model.dart';

class ApiHandler {
  static Future<List<dynamic>> getData({
    required String target,
    String? limit,
  }) async {
    try {
      Uri uri = Uri.https(
        baseUrl,
        "/api/v1/$target",
        target == "products"
            ? {
                "offset": "0",
              }
            : {
                "limit": limit,
              },
      );
      http.Response response = await http.get(uri);
      // print("response ${jsonDecode(response.body)}");
      dynamic data = jsonDecode(response.body);
      List tempList = [];
      if (response.statusCode != 200) {
        throw data["message"];
      }
      for (dynamic value in data) {
        // print("Value:$value \n\n");
        tempList.add(value);
      }
      return tempList;
    } catch (error) {
      log("An error occurred $error" as num);
      throw error.toString();
    }
  }

  static Future<List<ProductsModel>> getAllProducts(
      {required String limit}) async {
    List tempList = await getData(
      target: "products",
      limit: limit,
    );
    return ProductsModel.productsFromSnapshot(tempList);
  }

  static Future<List<CategoryModel>> getAllCategories() async {
    List tempList = await getData(target: "categories");
    return CategoryModel.categoriesFromSnapshot(tempList);
  }

  static Future<List<UserModel>> getAllUsers() async {
    List tempList = await getData(target: "users");
    return UserModel.categoriesFromSnapshot(tempList);
  }

  static Future<ProductsModel> getProductById({required String id}) async {
    try {
      Uri uri = Uri.https(
        baseUrl,
        "/api/v1/products/$id",
      );
      http.Response response = await http.get(uri);
      // print("response ${jsonDecode(response.body)}");
      dynamic data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data['message'];
      }
      return ProductsModel.fromJson(data);
    } catch (error) {
      log("An error occurred $error" as num);
      throw error.toString();
    }
  }
}
