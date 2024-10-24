class UserModel {
  final String name;
  final String surname;
  final String phoneNumber;
  final String email;
  final String password;

  
  UserModel({
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  Map<String, String> toJson() {
    return {
      'Name': name,
      'Surname': surname,
      'PhoneNumber': phoneNumber,
      'Email': email,
      'Password': password,
    };
  }
}