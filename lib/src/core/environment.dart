class Environment {
  static const String environment = String.fromEnvironment('env', defaultValue: 'dev');
  static const String apiBaseUrl = String.fromEnvironment('API_BASE_URL');
  static const String Supabase_url = String.fromEnvironment('SUPABASE_URL');
  static const String Supabase_anonkey = String.fromEnvironment('SUPABASE_ANONKEY');

}
