
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  UserModel({
    this.id,
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
  });
  UserModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    email=json['email'];
    password=json['password'];
    name=json['name'];
    role=json['role'];
    avatar=json['avatar'];
  }
  static List<UserModel> categoriesFromSnapshot(List productSnapshot) {
    return productSnapshot.map(
          (data) {
        return UserModel.fromJson(data);
      },
    ).toList();
  }

}
