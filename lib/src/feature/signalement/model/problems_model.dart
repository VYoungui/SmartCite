import 'dart:convert';

import 'package:smart_cite/src/feature/signalement/model/categories_model.dart';
import 'package:smart_cite/src/feature/auth/model/user_model.dart';


List<Problems> userFromJson(String str) => List<Problems>.from(json.decode(str).map((x) => Problems.fromJson(x)));

String userToJson(List<Problems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Problems {
  String id;
  String description;
  String? image_url;
  String localisation;
  String? status;
  Profiles reporter_id;
  Profiles? agent_id;
  Categories category_id;
  DateTime created_at;
  DateTime? date_in_progress;
  DateTime? date_resolved;
  DateTime? date_archived;
  DateTime? updated_at;



  Problems({
    required this.id,
    required this.description,
    this.image_url,
    required this.localisation,
    required this.reporter_id,
    required this.category_id,
    this.agent_id,
    this.status,
    required this.created_at,
    this.updated_at,
    this.date_archived,
    this.date_in_progress,
    this.date_resolved
  });

  factory Problems.fromJson(Map<String, dynamic> json) => Problems(
    id: json['id'],
    description: json['description'],
    image_url: json['image_url'],
    localisation: json['location'],
    status: json['status'],
    reporter_id: Profiles.fromJson(json['reporter_id']),
    agent_id: Profiles.fromJson(json['agent_id']),
    category_id: Categories.fromJson(json['category_id']),
    created_at: DateTime.parse(json['created_at']),
    updated_at: DateTime.parse(json['updated_at']),
    date_resolved: DateTime.parse(json['date_resolved']),
    date_in_progress: DateTime.parse(json['date_in_progress']),
    date_archived: DateTime.parse(json['date_archived']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    description : description,


  };
}