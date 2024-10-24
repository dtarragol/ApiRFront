
import 'package:apir_front/src/models/UserModel.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel _user = UserModel(name: '', surname: '', phoneNumber: '', email: '', password: '');

  UserModel get user => _user;

  void updateUser(String name, int age) {
    _user = UserModel(name: name, surname: '', phoneNumber: '', email: '', password: '');
    notifyListeners();
  }
}