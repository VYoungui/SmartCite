import 'package:crypto/crypto.dart';
import 'dart:convert';

class PasswordEncoder {
  String encode(String raw) => sha256.convert(utf8.encode(raw)).toString();
  //String compare(String raw) => sha256
}