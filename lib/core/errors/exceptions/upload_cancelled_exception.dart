import 'app_exception.dart';

class UploadCancelledException extends AppException{
  const UploadCancelledException({
    super.cause,
    super.message,
    super.stackTrace,
  });
}
