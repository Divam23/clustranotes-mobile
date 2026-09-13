import 'package:clustranotes_mobile/core/errors/exceptions/app_exception.dart';

class UnknownException extends AppException{
  const UnknownException({
    super.cause,
    super.message,
    super.stackTrace,
  });
}
