
import 'package:apir_front/src/models/UserModel.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel _user = UserModel(name: "John Doe", age: 30);

  UserModel get user => _user;

  void updateUser(String name, int age) {
    _user = UserModel(name: name, age: age);
    notifyListeners();
  }
}