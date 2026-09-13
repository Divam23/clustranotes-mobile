import 'package:clustranotes_mobile/core/errors/exceptions/api_exception.dart';

class ForbiddenException extends ApiException{
  const ForbiddenException({
    super.cause,
    super.errors,
    super.stackTrace,
    super.message,
    super.statusCode = 403
  });
}
