
import 'package:apir_front/src/models/NewUserModel.dart';
import 'package:apir_front/src/models/UserModel.dart';
import 'package:flutter/material.dart';

class NewUserProvider with ChangeNotifier {
  NewUserModel _user = NewUserModel(name: '', surname: '', phoneNumber: '', email: '', password: '');

  NewUserModel get user => _user;

  void updateUser(String name, int age) {
    _user = NewUserModel(name: name, surname: '', phoneNumber: '', email: '', password: '');
    notifyListeners();
  }
}