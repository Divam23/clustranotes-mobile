import 'package:clustranotes_mobile/core/errors/exceptions/app_exception.dart';

abstract class ApiException extends AppException{
  final int statusCode;
  final List<Object?> errors;
  const ApiException({
    required this.statusCode,
    this.errors = const [],
    super.message,
    super.cause,
    super.stackTrace
  });
}
