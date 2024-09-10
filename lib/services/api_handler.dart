import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_store/models/user_model.dart';

import '../constants/api_constants.dart';
import '../models/categories_model.dart';
import '../models/products_model.dart';

class ApiHandler {
  static Future<List<dynamic>> getData({required String target}) async {
    Uri uri = Uri.https(baseUrl, "/api/v1/$target");
    http.Response response = await http.get(uri);
    // print("response ${jsonDecode(response.body)}");
    dynamic data = jsonDecode(response.body);
    List tempList = [];
    for (dynamic value in data) {
      // print("Value:$value \n\n");
      tempList.add(value);
    }
    return tempList;
  }

  static Future<List<ProductsModel>> getAllProducts() async {
    List tempList = await getData(target: "products");
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
    Uri uri = Uri.https(baseUrl, "/api/v1/products/$id");
    http.Response response = await http.get(uri);
    // print("response ${jsonDecode(response.body)}");
    dynamic data = jsonDecode(response.body);
    return ProductsModel.fromJson(data);
  }

}
