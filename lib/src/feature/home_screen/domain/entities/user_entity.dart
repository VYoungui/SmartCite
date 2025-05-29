import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class UserEntity extends Equatable {
  final Uuid? id;
  final String email;
  final String password;
  final String? full_name;
  final String? role;
  final String? avatar_url;
  final String? fcm_token;

  UserEntity({
    required this.password,
    required this.email,
    required this.id,
    required this.full_name,
    required this.role,
    required this.avatar_url,
    required this.fcm_token,
  });

  UserEntity copyWith({
    Uuid? id,
    String? email,
    String? password,
    String? full_name,
    String? role,
    String? avatar_url,
    String? fcm_token,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      full_name: full_name ?? this.full_name,
      role: role ?? this.role,
      avatar_url: avatar_url ?? this.avatar_url,
      fcm_token: fcm_token ?? this.fcm_token,
    );
  }

  @override
  List<Object?> get props => [
    id,
    email,
    password,
    full_name,
    role,
    avatar_url,
    fcm_token,
  ];
}
