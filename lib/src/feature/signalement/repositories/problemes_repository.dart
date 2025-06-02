import 'package:flutter/foundation.dart';
import 'package:smart_cite/src/feature/dto/request/categories_request.dart';
import 'package:smart_cite/src/feature/dto/request/problems_request.dart';
import 'package:smart_cite/src/feature/signalement/model/categories_model.dart';
import 'package:smart_cite/src/feature/signalement/model/problems_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../shared/repository/base_repository.dart';



class ProblemesRepository extends BaseRepository {

  Future<List<Problems>> Create_Problems (ProblemsRequest problemesRequest) async {
    final dataProblems = await Supabase.instance.client.from('mobiles_app.problems').insert(problemesRequest).select();
    if (kDebugMode) {
      print(dataProblems);
    }
    List<Problems> problems = [];
    for (var element in dataProblems) {
      problems.add(Problems.fromJson(element));
    }
    return problems;
  }

  Future<List<Problems>> Get_Problems () async {
    final dataProblems = await Supabase.instance.client.from('mobiles_app.problems').select();
    if (kDebugMode) {
      print(dataProblems);
    }
    List<Problems> problems = [];
    for (var element in dataProblems) {
      problems.add(Problems.fromJson(element));
    }
    return problems;
  }

  Future<List<Problems>> Update_Problems (ProblemsRequest problemesRequest) async {
    final dataProblems = await Supabase.instance.client.from('mobiles_app.problems').select('id').eq("name", problemesRequest);
    if(dataProblems == null) throw new Exception("Categories Not Found");
    //final hash = _passwordEncoder

    final data = await Supabase.instance.client.from('mobiles_app.problems').update({'name': problemesRequest}).eq("id", problemesRequest);
    if (kDebugMode) {
      print(dataProblems);
    }
    List<Problems> problems = [];
    for (var element in data) {
      problems.add(Problems.fromJson(element));
    }
    return problems;
  }

  Future<List<Problems>> Delete_Problems (int id) async {
    final dataProblems = await Supabase.instance.client.from('mobiles_app.problems').select().eq("id", id);
    if (kDebugMode) {
      print(dataProblems);
    }
    await Supabase.instance.client.from("mobile_app.problems").delete().eq("id", id).select();
    List<Problems> problems = [];
    for (var element in dataProblems) {
      problems.add(Problems.fromJson(element));
    }
    return problems;

  }



}