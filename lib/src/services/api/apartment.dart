import 'package:apir_front/src/models/ApartmentModel.dart';
import 'package:apir_front/src/utils/api_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiApartmentGet 
{
  static Future<List<ApartmentModel>> searchProperties(String search) async {

    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'jwt_token');
    
    if (token == null) {
      throw Exception('ApiError.TOKEN_NOT_FOUND');
    }

    final response = await http.get(
      Uri.parse(ApiGetPropertyConstants.search(search)),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      }
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);

      List<ApartmentModel> propertyList = jsonResponse.map((json) 
                                          => ApartmentModel.fromJson(json)).toList();
      return propertyList;
    } else {
      throw Exception('Failed to load properties');
    }
  }
  static Future<ApartmentModel> byId(int id) async {

    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'jwt_token');
    
    if (token == null) {
      throw Exception('ApiError.TOKEN_NOT_FOUND');
    }

    final response = await http.get(
      Uri.parse(ApiGetApartmentConstants.byId(id)),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      }
    );

    if (response.statusCode == 200) {
      var property = ApartmentModel.fromJson(json.decode(response.body));
      return property;
    } else {
      throw Exception('Failed to load property');
    }
  }
  static Future<ApartmentModel> byIdProperty(int idproperty) async {

    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'jwt_token');
    
    if (token == null) {
      throw Exception('ApiError.TOKEN_NOT_FOUND');
    }

    final response = await http.get(
      Uri.parse(ApiGetApartmentConstants.byIdProperty(idproperty)),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      }
    );

    if (response.statusCode == 200) {
      var property = ApartmentModel.fromJson(json.decode(response.body));
      return property;
    } else {
      throw Exception('Failed to load property');
    }
  }


}