import 'package:flutter/foundation.dart';
import 'package:smart_cite/src/config/util/password_encryption.dart';
import 'package:smart_cite/src/feature/auth/model/user_model.dart';
import 'package:smart_cite/src/feature/dto/request/login_request.dart';
import 'package:smart_cite/src/feature/dto/request/register_request.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../shared/model/reponse_entity.dart';
import '../../../shared/repository/base_repository.dart';



class AuthRepository extends BaseRepository {

  late final PasswordEncoder _passwordEncoder;


  Future<List<Profiles>> login (LoginRequest loginRequest) async {
    final data_email = await Supabase.instance.client.from('mobiles_app.profiles').select().eq('email', loginRequest.email);
    if(data_email == null) throw new Exception("User Not Found");
    //final hash = _passwordEncoder
    final data = await Supabase.instance.client.from('mobiles_app.profiles').select().eq('email', loginRequest.email).eq('password', loginRequest.password);
    if (kDebugMode) {
      print(data);
    }
    List<Profiles> profiles = [];
    for (var element in data) {
      profiles.add(Profiles.fromJson(element));
    }
    return profiles;
  }

  Future<List<Profiles>> register (RegisterRequest registerRequest) async {
    final password_encrypt = _passwordEncoder.encode(registerRequest.password);
    final payload = {
      'email': registerRequest.email,
      'password': password_encrypt,
      'full_name': registerRequest.full_name,
      'role': registerRequest.role,
      'avatar_url': registerRequest.avatar_url,
      'fcm_token': registerRequest.fcm_token,
      // Ajoute les autres champs si nécessaires
    };
    final data = await Supabase.instance.client.from('mobiles_app.profiles').insert(payload).select();
    if (kDebugMode) {
      print(data);
    }
    List<Profiles> profiles = [];
    for (var element in data) {
      profiles.add(Profiles.fromJson(element));
    }
    return profiles;
  }


}