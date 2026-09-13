import 'package:clustranotes_mobile/core/errors/exceptions/app_exception.dart';

class NetworkException extends AppException{
  const NetworkException({
    super.cause,
    super.message,
    super.stackTrace,
  });
}
