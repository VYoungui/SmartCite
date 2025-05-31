import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../shared/repository/base_repository.dart';
import '../model/user_model.dart';

class UserRepository extends BaseRepository{


  Future<List<Profiles>> getUser (String email) async {
    final data = await Supabase.instance.client.from('mobiles_app.profiles').select().eq('email', email);
    if (kDebugMode) {
      print(data);
    }
    List<Profiles> profiles = [];
    for (var element in data) {
      profiles.add(Profiles.fromJson(element));
    }
    return profiles;
  }

  Future<List<Profiles>> getUserById (Uuid id) async {
    final data = await Supabase.instance.client.from('mobiles_app.profiles').select().eq('id', id);
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