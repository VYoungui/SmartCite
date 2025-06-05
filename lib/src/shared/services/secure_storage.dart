import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smart_cite/src/feature/auth/model/user_model.dart';

class SecureStorage {
  final FlutterSecureStorage storage;
  SecureStorage({
    FlutterSecureStorage? storage,
  }) : storage = storage ??
      FlutterSecureStorage(
        aOptions: AndroidOptions.defaultOptions.copyWith(encryptedSharedPreferences: true),
      );

  Future<void> saveAccessToken(String accessToken) async {
    await storage.write(key: accessTokenKey, value: accessToken);
  }

  Future<String?> getAccessToken() async {
    final access = await storage.read(key: accessTokenKey);
    return access;
  }

  Future<void> removeAccessToken() async {
    await storage.delete(key: accessTokenKey);
  }

  Future<void> saveRole(String role) async {
    await storage.write(key: roleKey, value: role);
  }

  Future<String?> getRole() async {
    final role = await storage.read(key: roleKey);
    return role;
  }

  Future<void> removeRole() async {
    await storage.delete(key: roleKey);
  }

  Future<void> saveUser(Profiles user) async {
    await storage.write(key: userKey, value: jsonEncode(user.toJson()));
  }

  Future<Profiles?> getUser() async {
    final user = await storage.read(key: userKey);
    return Profiles.fromJson(jsonDecode(user!));
  }

  Future<void> removeUser() async {
    await storage.delete(key: userKey);
  }

  Future<void> saveRefreshToken(String refreshToken) async {
    await storage.write(key: refreshTokenKey, value: refreshToken);
  }

  Future<String?> getRefreshToken() async {
    final access = await storage.read(key: refreshTokenKey);
    return access;
  }

  Future<void> removeRefreshToken() async {
    await storage.delete(key: refreshTokenKey);
  }

  static const String accessTokenKey = 'access-token';
  static const String roleKey = 'role';
  static const String userKey = 'user';
  static const String refreshTokenKey = 'refresh-token';
}
