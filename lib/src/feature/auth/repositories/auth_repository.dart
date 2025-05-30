import 'package:flutter/foundation.dart';
import 'package:smart_cite/src/feature/auth/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../shared/model/reponse_entity.dart';
import '../../../shared/repository/base_repository.dart';



class AuthRepository extends BaseRepository {

  Future<List<QuizDetails>> getQuizWithDetails () async {
    final data = await  Supabase.instance.client.from('quiz').select(
        ', domain() ,section(, title(),question(*))').order('id', ascending: true);
    if (kDebugMode) {
      print(data);
    }
    List<QuizDetails> quizDetails = [];
    for (var element in data) {
      quizDetails.add(QuizDetails.fromJson(element));
    }

    return quizDetails;
  }

  Future<List<Profiles>> getUsers () async {
    final data = await  Supabase.instance.client.from('mobiles_app.profiles').select();
    if (kDebugMode) {
      print(data);
    }
    List<Profiles> profiles = [];
    for (var element in data) {
      profiles.add(Profiles.fromJson(element));
    }
  }



  Future<ResponseEntity> login(LoginRequest loginRequest) async {
    print('$authUrl/login');
    print(loginRequest.toJson());
    final response = await dio.post(
      '$authUrl/login',
      data: loginRequest.toJson(),
    );
    print('done');
    print(response.data);
    return ResponseEntity.fromJson(response.data);
  }

}