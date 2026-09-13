import 'package:clustranotes_mobile/core/errors/mappers/dio_exception_mapper.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;
  ApiClient(this._dio);

  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
    try {
      return _dio.get(path, queryParameters: queryParameters);
    } on DioException catch (error) {
      throw DioExceptionMapper.map(error);
    }
  }

  Future<Response<T>> post<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    try {
      return _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (error) {
      throw DioExceptionMapper.map(error);
    }
  }

  Future<Response<T>> put<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    try {
      return _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (error) {
      throw DioExceptionMapper.map(error);
    }
  }

  Future<Response<T>> patch<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    try {
      return _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (error) {
      throw DioExceptionMapper.map(error);
    }
  }

  Future<Response<T>> delete<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    try {
      return _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (error) {
      throw DioExceptionMapper.map(error);
    }
  }

  Future<Response<T>> postMultipart<T>({
    required String path,
    required FormData data,
    Map<String, dynamic>? queryParameters,
    void Function(int sent, int total)? onSendProgress,
    Options? options,
  }) {
    try {
      return _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: (options ?? Options()).copyWith(
          sendTimeout: const Duration(minutes: 5),
        ),
        onSendProgress: onSendProgress,
      );
    } on DioException catch (error) {
      throw DioExceptionMapper.map(error);
    }
  }
}
