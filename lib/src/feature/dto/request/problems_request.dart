import 'dart:convert';

List<ProblemsRequest> ProblemsRequestFromJson(String str) => List<ProblemsRequest>.from(json.decode(str).map((x) => ProblemsRequest.fromJson(x)));

String ProblemsRequestToJson(List<ProblemsRequest> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProblemsRequest {
  String description;
  String? image_url;
  String localisation;
  String? status;
  String report_id;
  String? agent_id;
  int category_id;

  ProblemsRequest({
    required this.description,
    required this.image_url,
    required this.localisation,
    required this.status,
    required this.report_id,
    required this.agent_id,
    required this.category_id,
  });

  factory ProblemsRequest.fromJson(Map<String, dynamic> json) => ProblemsRequest(
    description: json["description"],
    image_url: json["image_url"],
    localisation: json['localisation'],
    status: json['status'],
    report_id: json['report_id'],
    agent_id: json['agent_id'],
    category_id: json['category_id'],

  );

  Map<String, dynamic> toJson() => {
    "description": description.toString(),
    "image_url": image_url.toString(),
    "localisation": localisation.toString(),
    "status": status.toString(),
    "report_id": report_id,
    "agent_id": agent_id,
    "category_id": category_id,
  };

}