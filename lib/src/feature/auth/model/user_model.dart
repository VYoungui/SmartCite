import 'dart:convert';


import 'package:uuid/uuid.dart';


List<Profiles> userFromJson(String str) => List<Profiles>.from(json.decode(str).map((x) => Profiles.fromJson(x)));

String userToJson(List<Profiles> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Profiles {
  Uuid id;
  String full_name;
  String email;
  String password;
  String role;
  String avatar_url;
  String fcm_token;
  DateTime created_at;


  Profiles({
    required this.id,
    required this.full_name,
    required this.email,
    required this.password,
    required this.role,
    required this.avatar_url,
    required this.fcm_token,
    required this.created_at,
  });

  factory Profiles.fromJson(Map<String, dynamic> json) => Profiles(
    id: json['id'],
    full_name: json['full_name'],
    email: json['email'],
    password: json['password'],
    role: json['role'],
    avatar_url: json['avatar_url'],
    fcm_token: json['fcm_token'],
    created_at: DateTime.parse(json['created_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'full_name': full_name,
    'email': email,
    'password': password,
    'role': 'citizen',
    'avatar_url': avatar_url,
    'fcm_token': fcm_token,
    'created_at': created_at.toIso8601String(),
  };
}