import 'dart:convert';

List<RegisterRequest> registerRequestFromJson(String str) => List<RegisterRequest>.from(json.decode(str).map((x) => RegisterRequest.fromJson(x)));

String registerRequestToJson(List<RegisterRequest> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RegisterRequest {
  String full_name;
  String email;
  String password;
  String role;
  String avatar_url;
  String fcm_token;

  RegisterRequest({
    required this.full_name,
    required this.email,
    required this.password,
    required this.role,
    required this.avatar_url,
    required this.fcm_token,

  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
    full_name: json['full_name'],
    email: json['email'],
    password: json['password'],
    role: json['role'],
    avatar_url: json['avatar_url'],
    fcm_token: json['fcm_token'],
  );

  Map<String, dynamic> toJson() => {
    'full_name': full_name,
    'email': email,
    'password': password,
    'role': 'citizen',
    'avatar_url': avatar_url,
    'fcm_token': fcm_token,
  };
}