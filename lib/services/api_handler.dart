import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';

class ApiHandler {
  static Future<void> getAllProducts() async {
    Uri uri = Uri.https(baseUrl,"/api/v1/products");
    http.Response response = await http.get(uri);
    print("response ${jsonDecode(response.body)}");
  }
}
