import 'dart:convert';

List<ResponseEntity> responseEntityFromJson(String str) => List<ResponseEntity>.from(json.decode(str).map((x) => ResponseEntity.fromJson(x)));

String responseEntityToJson(List<ResponseEntity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResponseEntity {
  bool success;
  String message;
  dynamic data;

  ResponseEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ResponseEntity.fromJson(Map<String, dynamic> json) => ResponseEntity(
    success: json['success'],
    message: json['message'],
    data: json['data'],
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data,
  };
}