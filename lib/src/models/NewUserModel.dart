class NewUserModel {
  final String name;
  final String surname;
  final String phoneNumber;
  final String email;
  final String password;

  
  NewUserModel({
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
  factory NewUserModel.fromJson(Map<String, dynamic> json) {
    return NewUserModel(
      name: json['Name'] as String,
      surname: json['Surname'] as String,
      phoneNumber: json['PhoneNumber'] as String,
      email: json['Email'] as String,
      password: json['Password'] as String,
    );
  }
}