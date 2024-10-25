class UserModel {
  final int id;
  final String name;
  final String surname;
  final String phoneNumber;
  final String email;

  
  UserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.email,
  });

  Map<String, String> toJson() {
    return {
      'id': id.toString(),
      'Name': name,
      'Surname': surname,
      'PhoneNumber': phoneNumber,
      'Email': email,
    };
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] as String,
      surname: json['surname'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String
    );
  }
}