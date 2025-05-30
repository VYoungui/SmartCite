import 'dart:convert';

import 'package:smart_cite/src/feature/auth/model/categories_model.dart';
import 'package:smart_cite/src/feature/auth/model/user_model.dart';
import 'package:uuid/uuid.dart';


List<Problems> userFromJson(String str) => List<Problems>.from(json.decode(str).map((x) => Problems.fromJson(x)));

String userToJson(List<Problems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Problems {
  Uuid id;
  String description;
  String? image_url;
  String localisation;
  String? status;
  Profiles report;
  Profiles? agent;
  Categories categories;



  Problems({
    required this.id,
    required this.description,
    this.image_url,
    required this.localisation,
    required this.report,
    required this.categories,
    this.agent,
    this.status,
  });

  factory Problems.fromJson(Map<String, dynamic> json) => Problems(
    id: json['id'],
    description: json['description'],
    image_url: json['image_url'],
    localisation: json['localisation'],
    status: json['status'],
    report: Profiles.fromJson(json['report']),
    agent: Profiles.fromJson(json['agent']),
    categories: Categories.fromJson(json['categories'])
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    description : description,


  };
}