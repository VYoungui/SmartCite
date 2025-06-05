import 'package:flutter/foundation.dart';
import 'package:smart_cite/src/feature/auth/model/user_model.dart';
import 'package:smart_cite/src/feature/dto/request/login_request.dart';
import 'package:smart_cite/src/feature/dto/request/register_request.dart';
import 'package:smart_cite/src/shared/model/reponse_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class AuthRepository {

  get email => null;
  get password => null;

  Future<ResponseEntity> login(LoginRequest loginRequest) async {
    final AuthResponse res = await Supabase.instance.client.auth.signInWithPassword(
      email: loginRequest.email,
      password: loginRequest.password,
    );

    final Session? session = res.session;

    if (kDebugMode) {
      print(session);
    }

    // On construit explicitement l'objet plutôt que d'appeler fromJson
    return ResponseEntity(
      success: session != null,
      message: session != null ? 'Connexion réussie' : 'Échec de la connexion',
      data: session, // Tu peux choisir de ne renvoyer que session.accessToken
    );
  }


  Future<ResponseEntity> register(RegisterRequest registerRequest) async {
    final AuthResponse res = await Supabase.instance.client.auth.signUp(
      email: registerRequest.email,
      password: registerRequest.password,
      /*data: {
        'username': registerRequest.full_name,
      },
       */
    );

    final Session? session = res.session;
    final User? user = res.user;

    if (user != null) {
      await Supabase.instance.client.from('profiles').insert({
        'id': user.id,
        'full_name': registerRequest.full_name,
        'fcm_token': session?.accessToken,
      });
    }
    return ResponseEntity(
      success: session != null,
      message: session != null ? 'Connexion réussie' : 'Échec de la connexion',
      data: session, // Tu peux choisir de ne renvoyer que session.accessToken
    );

  }

  Future<Profiles> getUser(String id) async {
    final result = await Supabase.instance.client
        .from('profiles')
        .select('*').eq('id', id);

    if (kDebugMode) {
      print(result);
    }
    return Profiles.fromJson(result[0]);
  }
}