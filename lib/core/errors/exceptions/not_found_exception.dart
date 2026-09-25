import 'package:clustranotes_mobile/core/errors/exceptions/api_exception.dart';

class NotFoundException extends ApiException{
  const NotFoundException({
    super.message,
    super.cause,
    super.errors,
    super.stackTrace,
    super.statusCode = 404
  });
  
}
