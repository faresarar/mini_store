import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../models/models/products_model.dart';

class ApiHandler {
  static Future<List<ProductsModel>> getAllProducts() async {
    Uri uri = Uri.https(baseUrl, "/api/v1/products");
    http.Response response = await http.get(uri);
   // print("response ${jsonDecode(response.body)}");
    dynamic data = jsonDecode(response.body);
    List tempList = [];
    for (dynamic value in data) {
     // print("Value:$value \n\n");
      tempList.add(value);
    }
    return ProductsModel.productsFromSnapshot(tempList);
  }
}
