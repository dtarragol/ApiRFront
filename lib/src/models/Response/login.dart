class ResponseLogin {
  final bool succes;
  final String? token;
  final String? email;
  final bool? active;

  ResponseLogin({required this.succes, this.active, this.email, this.token});

  factory ResponseLogin.fromJson(Map<String, dynamic> json) {
    return ResponseLogin(
      succes: true,
      email: json['email'],
      token: json['token'],
      active: json['active'],
    );
  }
}