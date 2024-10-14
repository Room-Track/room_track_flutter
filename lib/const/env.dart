class EnvVariables {
  static String apiUrl = const String.fromEnvironment('API_URL',
      defaultValue: 'localhost:3000');
}
