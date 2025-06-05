import 'package:flutter/foundation.dart';
import 'package:smart_cite/src/feature/dto/request/problems_request.dart';
import 'package:smart_cite/src/feature/signalement/model/problems_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class ProblemsRepository {
  Future<List<Problems>> createProblems(
      ProblemsRequest problemesRequest) async {
    final dataProblems = await Supabase.instance.client
        .from('mobiles_app.problems')
        .insert(problemesRequest)
        .select();
    if (kDebugMode) {
      print(dataProblems);
    }
    List<Problems> problems = [];
    for (var element in dataProblems) {
      problems.add(Problems.fromJson(element));
    }
    return problems;
  }

  Future<List<Problems>> getProblems() async {
    final dataProblems = await Supabase.instance.client
        .from('mobiles_app.problems')
        .select('*,reporter(*),agent(*),category(*)');
    if (kDebugMode) {
      print(dataProblems);
    }
    List<Problems> problems = [];
    for (var element in dataProblems) {
      problems.add(Problems.fromJson(element));
    }
    return problems;
  }

  Future<void> updateProblems(
      Problems problem) async {
    final data = await Supabase.instance.client
        .from('mobiles_app.problems')
        .update(problem.toJson()).eq("id", problem.id);
    if (kDebugMode) {
      print(data);
    }
  }

  Future<void> changeProblemStatus(
      Problems problem, String newStatus) async {
    final data = await Supabase.instance.client
        .from('mobiles_app.problems')
        .update({'status': newStatus}).eq("id", problem.id);
    if (kDebugMode) {
      print(data);
    }
  }

  Future<void> deleteProblems(Uuid id) async {
    final result = await Supabase.instance.client
        .from("mobile_app.problems")
        .delete()
        .eq("id", id)
        .select();
    if (kDebugMode) {
      print(result);
    }
  }
}
