import 'dart:convert';

List<RegisterRequest> registerRequestFromJson(String str) => List<RegisterRequest>.from(json.decode(str).map((x) => RegisterRequest.fromJson(x)));

String registerRequestToJson(List<RegisterRequest> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RegisterRequest {
  String full_name;
  String email;
  String password;

  RegisterRequest({
    required this.full_name,
    required this.email,
    required this.password,

  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
    full_name: json['full_name'],
    email: json['email'],
    password: json['password'],
  );

  Map<String, dynamic> toJson() => {
    'full_name': full_name,
    'email': email,
    'password': password,
  };
}