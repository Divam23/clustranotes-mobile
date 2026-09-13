class AppFailure {
  final String message;
  final bool retryable;
  const AppFailure({
    required this.message,
    this.retryable = false,
  });
}
