import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

Future<void> saveToken(String token) async {
// Guardar el token
await storage.write(key: 'jwt_token', value: token);
}

Future<String?> readToken() async {
  String? token = await storage.read(key: 'jwt_token');
  return token;
}