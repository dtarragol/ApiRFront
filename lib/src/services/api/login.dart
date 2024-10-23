import 'dart:convert';
import 'package:apir_front/src/models/Response/login.dart';
import 'package:apir_front/src/ui/screens/Home.dart';
import 'package:apir_front/src/utils/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiLoginPost 
{
  static Future<ResponseLogin> login(BuildContext context, String email, String password) async {

    final response = await http.post(
      Uri.parse(ApiPostLoginConstants.login),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    final responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final token = responseData['token'];
      const storage = FlutterSecureStorage();
      await storage.write(key: 'jwt_token', value: token);

      return ResponseLogin.fromJson(responseData);
    }else
    {
      return ResponseLogin(succes: false);
    }
  }

  Future<String?> getToken() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: 'jwt_token');
  }

  Future<void> removeToken() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'jwt_token');
  }

  void logout(BuildContext context) async {
    await removeToken();
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  Future<void> checkLoginStatus(BuildContext context) async {
    /*String? token = await getToken();
    if (token != null) {
      var idUser = await getIdUserLogged(context);
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      String role = decodedToken['role']; 

      if (role == FunctionalConstants.ROLE_COMPANY_NAME 
          && await ApiGetCompany.CompanyExist(context, idUser)) {

        Utils.navigateToPage(context, const CompanyHomePage(index: 4));

      } else if (role == FunctionalConstants.ROLE_CANDIDATE_NAME
          && await ApiGetCandidate.CandidateExist(context, idUser)) {

        Utils.navigateToPage(context, const CandidateHomePage(index: 4));

      } else if (role == FunctionalConstants.ROLE_COMPANY_NAME 
          && !(await ApiGetCompany.CompanyExist(context, idUser))) {

        Utils.navigateToPage(context, const NewCompanyPage());

      } else if (role == FunctionalConstants.ROLE_CANDIDATE_NAME
          && !(await ApiGetCandidate.CandidateExist(context, idUser))) {

        Utils.navigateToPage(context, NewCandidatePage(idUSer: idUser));
      }
    }*/
  }
    
}