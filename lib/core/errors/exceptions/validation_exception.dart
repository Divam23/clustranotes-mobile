import 'package:clustranotes_mobile/core/errors/exceptions/api_exception.dart';

class ValidationException extends ApiException{
  const ValidationException({
    super.cause,
    super.errors,
    super.stackTrace,
    super.message,
    super.statusCode = 400
  });
}
