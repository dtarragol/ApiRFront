import 'package:apir_front/src/models/PropertyModel.dart';
import 'package:apir_front/src/utils/api_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiPropertyGet 
{
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
  static Future<PropertyModel> byId(int id) async {

    // const storage = FlutterSecureStorage();
    // String? token = await storage.read(key: 'jwt_token');
    
    // if (token == null) {
    //   throw Exception(ApiError.TOKEN_NOT_FOUND);
    // }

    final response = await http.get(
      Uri.parse(ApiGetPropertyConstants.byId(id)),
      headers: <String, String>{
        // 'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      }
    );

    if (response.statusCode == 200) {
      var property = PropertyModel.fromJson(json.decode(response.body));
      return property;
    } else {
      throw Exception('Failed to load property');
    }
  }


}