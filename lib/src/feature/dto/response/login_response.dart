// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:smart_cite/src/feature/auth/model/user_model.dart';


List<LoginResponse> loginResponseFromJson(String str) => List<LoginResponse>.from(json.decode(str).map((x) => LoginResponse.fromJson(x)));

String loginResponseToJson(List<LoginResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginResponse {
  String token;
  Profiles user;
  //String nomPrenom;

  LoginResponse({
    required this.token,
    required this.user,
    //required this.nomPrenom,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    token: json['token'],
    user: Profiles.fromJson(json['user']),
    //nomPrenom: json['nom_prenom'],
  );

  Map<String, dynamic> toJson() => {
    'token': token,
    'user': user,
    //'nom_prenom': nomPrenom,
  };
}