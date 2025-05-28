

import 'package:supabase_flutter/supabase_flutter.dart';

const String supabaseUrl= "";
const String supabaseAnonKey =
    "";


class AppInitializer {
  Future<void> preAppRun() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  }

  Future<void> postAppRun() async {}
}
