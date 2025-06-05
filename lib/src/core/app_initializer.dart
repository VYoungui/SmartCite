

import 'package:supabase_flutter/supabase_flutter.dart';

const String supabaseUrl= "https://xwckyiewzixovhjirroi.supabase.co/";
const String supabaseAnonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh3Y2t5aWV3eml4b3Zoamlycm9pIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDkwMDkwMTQsImV4cCI6MjA2NDU4NTAxNH0.hOh4xzKNJV4PxMUF8IDL4YMRUcP50Djkmz9CHRk_ArQ"
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
