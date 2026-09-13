abstract class AppException implements Exception{
  final String? message;
  final Object? cause;
  final StackTrace? stackTrace;
  const AppException({
    this.message,
    this.cause,
    this.stackTrace,
  });
}

