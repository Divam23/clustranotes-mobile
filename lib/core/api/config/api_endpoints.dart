class ApiEndpoints {
  ApiEndpoints._();
  
  static const String baseUrl = "https://hyperosmic-sylas-ideational.ngrok-free.dev/api/v1";

  // Auth
  static const String authenticate = '/auth/login';
  static const String currentUser = '/auth/me';
}
