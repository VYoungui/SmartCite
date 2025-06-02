import 'dart:convert';

List<CategoriesRequest> CategoriesRequestFromJson(String str) => List<CategoriesRequest>.from(json.decode(str).map((x) => CategoriesRequest.fromJson(x)));

String CategoriesRequestToJson(List<CategoriesRequest> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesRequest {
  String name;

  CategoriesRequest({
    required this.name
  });

  factory CategoriesRequest.fromJson(Map<String, dynamic> json) => CategoriesRequest(
    name: json['name'],

  );

  Map<String, dynamic> toJson() => {
    "name" : name.toString()
  };

}