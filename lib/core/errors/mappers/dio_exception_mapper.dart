import 'package:clustranotes_mobile/core/errors/exceptions/exceptions.dart';
import 'package:dio/dio.dart';

abstract final class DioExceptionMapper {
  static AppException map(DioException exception) {
    final response = exception.response;
    final statusCode = response?.statusCode;

    if (statusCode != null) {
      return _mapStatusCode(
        statusCode: statusCode,
        exception: exception,
        data: response?.data,
      );
    }

    switch (exception.type) {
      case DioException.connectionError:
        return NetworkException(
          cause: exception,
          stackTrace: exception.stackTrace,
        );

      case DioException.connectionTimeout:
      case DioException.sendTimeout:
      case DioException.receiveTimeout:
        return TimeoutException(
          cause: exception,
          stackTrace: exception.stackTrace,
        );

      default:
        return UnknownException(
          cause: exception,
          stackTrace: exception.stackTrace,
        );
    }
  }

  static AppException _mapStatusCode({
    required int statusCode,
    required DioException exception,
    required Object? data,
  }) {
    final errorData = _extractErrorData(data);
    final message = errorData.message;
    final errors = errorData.errors;
    switch (statusCode) {
      case 400:
        return ValidationException(
          message: message,
          errors: errors,
          cause: exception,
          stackTrace: exception.stackTrace,
        );
      case 401:
        return UnauthorizedException(
          message: message,
          errors: errors,
          cause: exception,
          stackTrace: exception.stackTrace,
        );
      case 403:
        return ForbiddenException(
          message: message,
          errors: errors,
          cause: exception,
          stackTrace: exception.stackTrace,
        );
      case 404:
        return NotFoundException(
          message: message,
          errors: errors,
          cause: exception,
          stackTrace: exception.stackTrace,
        );
      default:
        if (statusCode >= 500 && statusCode <= 599) {
          return ServerException(
            message: message,
            errors: errors,
            cause: exception,
            stackTrace: exception.stackTrace,
          );
        }
        
        return UnknownException(
          cause: exception,
          stackTrace: exception.stackTrace,
        );
    }
  }

  static _ApiErrorData _extractErrorData(Object? data) {
    if (data is! Map) {
      return const _ApiErrorData();
    }

    final message = data['message'];
    final errors = data['errors'];

    return _ApiErrorData(
      message: message is String ? message : null,
      errors: errors is List ? List<Object?>.from(errors) : const [],
    );
  }
}

class _ApiErrorData {
  final String? message;
  final List<Object?> errors;
  const _ApiErrorData({this.message, this.errors = const []});
}
