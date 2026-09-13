import 'package:clustranotes_mobile/core/errors/exceptions/api_exception.dart';

class UnauthorizedException extends ApiException{
  const UnauthorizedException({
    super.cause,
    super.errors,
    super.stackTrace,
    super.message,
    super.statusCode = 401
  });
}
