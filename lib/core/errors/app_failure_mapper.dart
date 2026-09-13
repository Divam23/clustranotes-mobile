import 'package:clustranotes_mobile/core/errors/app_failure.dart';
import 'package:clustranotes_mobile/core/errors/exceptions/exceptions.dart';

abstract final class AppFailureMapper {
  static AppFailure map(AppException exception) {
    switch (exception) {
      case NetworkException():
        return const AppFailure(
          retryable: true,
          message:
              "Unable to connect to the server. Please check your internet connection.",
        );
        
      case TimeoutException():
        return const AppFailure(
          retryable: true,
          message: "The request took too long. Please try again.",
        );

      case UnauthorizedException():
        return const AppFailure(
          message: "Your session has expired. Please sign in again.",
        );

      case ForbiddenException():
        return const AppFailure(
          message: "You do not have permission to perform this action.",
        );

      case NotFoundException():
        return const AppFailure(
          message: "The requested resource could not be found.",
        );

      case ServerException():
        return const AppFailure(
          message: "Something went wrong on the server. Please try again.",
        );

      case ValidationException():
        return AppFailure(
          message: exception.message ?? 'Please check the information you entered.',
        );

      case UnknownException():
        return const AppFailure(
          retryable: true,
          message: "Something went wrong. Please try again.",
        );
        
      default:
        return const AppFailure(
          message: "Something went wrong. Please try again.",
          retryable: true,
        );
    }
  }
}
