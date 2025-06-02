import 'dart:convert';

List<LoginRequest> loginRequestFromJson(String str) => List<LoginRequest>.from(json.decode(str).map((x) => LoginRequest.fromJson(x)));

String loginRequestToJson(List<LoginRequest> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginRequest {
  String email;
  String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    email: json["email"],
    password: json["mot_de_passe"],
  );

  Map<String, dynamic> toJson() => {
    "email": email.toString(),
    "mot_de_passe": password.toString(),
  };
}