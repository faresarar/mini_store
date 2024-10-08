/// to transform  json to dart  use : https://javiercbk.github.io/json_to_dart/
library;

import 'package:flutter/material.dart';

import 'categories_model.dart';

class ProductsModel with ChangeNotifier {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  CategoryModel? category;

  ProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
    category =
        json['category'] != null ? CategoryModel.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['images'] = images;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }

  static List<ProductsModel> productsFromSnapshot(List productSnapshot) {
    return productSnapshot.map(
      (data) {
        return ProductsModel.fromJson(data);
      },
    ).toList();
  }
}
