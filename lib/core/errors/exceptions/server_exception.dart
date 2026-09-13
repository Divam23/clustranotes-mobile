import 'package:clustranotes_mobile/core/errors/exceptions/api_exception.dart';

class ServerException extends ApiException{
  const ServerException({
    super.cause,
    super.errors,
    super.stackTrace,
    super.message,
    super.statusCode = 500
  });
}
