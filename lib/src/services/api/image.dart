import 'package:apir_front/src/models/image/ImageModel.dart';
import 'package:apir_front/src/models/image/NewImageModel.dart';
import 'package:apir_front/src/utils/api_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiImageGet 
{
  static Future<List<ImageModel>> byIdProperty(int idProperty) async {

    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'jwt_token');
    
    if (token == null) {
      throw Exception('ApiError.TOKEN_NOT_FOUND');
    }

    final response = await http.get(
      Uri.parse(ApiGetImageConstants.byPropertyId(idProperty)),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);

      List<ImageModel> propertyList = jsonResponse.map((json) 
                                          => ImageModel.fromJson(json)).toList();
      return propertyList;
    } else {
      throw Exception('Failed to load properties');
    }
  }

  static Future<bool> existByPropertyId(int idProperty) async {

    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'jwt_token');
    
    if (token == null) {
      throw Exception('ApiError.TOKEN_NOT_FOUND');
    }

    final response = await http.get(
      Uri.parse(ApiGetImageConstants.existByPropertyId(idProperty)),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return response.body == 'true' ? true : false;
    } else {
      throw Exception('Failed');
    }
  }

  static Future<ImageModel> firstByPropertyId(int idProperty) async {

    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'jwt_token');
    
    if (token == null) {
      throw Exception('ApiError.TOKEN_NOT_FOUND');
    }

    final response = await http.get(
      Uri.parse(ApiGetImageConstants.firstByPropertyId(idProperty)),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      }
    );
    if (response.statusCode == 200) {
      var image = ImageModel.fromJson(json.decode(response.body));
      return image;
    } else {
      throw Exception('Failed');
    }
  }
}

class ApiImagePost 
{
  static Future<bool> postImage(NewImage newImage) async {

    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'jwt_token');
    
    if (token == null) {
      throw Exception('ApiError.TOKEN_NOT_FOUND');
    }
    final   response = await http.post(
      Uri.parse(ApiPostImageConstants.newImage),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(newImage),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}