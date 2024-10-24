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
  
  //Trae una lista de candidatos
  static Future<List<PropertyModel>> searchProperties(String search) async {

    // const storage = FlutterSecureStorage();
    // String? token = await storage.read(key: 'jwt_token');
    
    // if (token == null) {
    //   throw Exception(ApiError.TOKEN_NOT_FOUND);
    // }

    final response = await http.get(
      Uri.parse(ApiGetPropertyConstants.search(search)),
      headers: <String, String>{
        // 'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      }
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);

      List<PropertyModel> propertyList = jsonResponse.map((json) 
                                          => PropertyModel.fromJson(json)).toList();
      return propertyList;
    } else {
      throw Exception('Failed to load properties');
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