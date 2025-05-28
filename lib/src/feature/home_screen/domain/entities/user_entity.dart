import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class UserEntity extends Equatable {

  final Uuid? id;
  final String? full_name;
  final String? role;
  final String? avatar_url;
  final String? fcm_token;

  UserEntity ({
    required this.id,
    required this.full_name,
    required this.role,
    required this.avatar_url,
    required this.fcm_token,
})

  @override
  // TODO: implement props
  List<Object?> get props => [
      id,
    full_name,
    role,
    avatar_url,
    fcm_token,
  ];



}