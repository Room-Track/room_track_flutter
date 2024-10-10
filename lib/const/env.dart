class EnvVariables {
  static String apiUrl = const String.fromEnvironment('API_URL',
      defaultValue: 'http://localhost:3000');
}
