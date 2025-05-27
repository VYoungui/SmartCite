class Environment {
  static const String environment = String.fromEnvironment('env', defaultValue: 'dev');
  static const String apiBaseUrl = String.fromEnvironment('API_BASE_URL');
}
