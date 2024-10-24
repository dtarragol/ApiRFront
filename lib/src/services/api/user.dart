import 'package:apir_front/src/models/PropertyModel.dart';
import 'package:apir_front/src/utils/api_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiUserPost {

  static Future<Map<String, dynamic>> getUserData(int userId) async {
    final response = await http.get(Uri.parse(ApiGetUserConstants.byId(userId)));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user data');
    }
  }
  

  static Future<Map<String, dynamic>> postUserData(Map<String, String> userData) async {
    final   response = await http.post(
      Uri.parse(ApiPostUserConstants.newUser),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(userData),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post user data');
    }
  }
}