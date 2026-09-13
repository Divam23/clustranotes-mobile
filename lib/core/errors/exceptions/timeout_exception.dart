import 'package:clustranotes_mobile/core/errors/exceptions/app_exception.dart';

class TimeoutException extends AppException{
  const TimeoutException({
    super.cause,
    super.message,
    super.stackTrace,
  });
}
