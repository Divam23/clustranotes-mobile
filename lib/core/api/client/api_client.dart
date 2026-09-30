import 'package:clustranotes_mobile/core/errors/mappers/dio_exception_mapper.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;
  ApiClient(this._dio);

  Future<Response<T>> get<T>({
    required String path,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
  }) {
    try {
      return _dio.get<T>(path, queryParameters: queryParameters);
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
      return _dio.post<T>(
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
      return _dio.put<T>(
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
      return _dio.patch<T>(
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
      return _dio.delete<T>(
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
    CancelToken? cancelToken,
    Options? options,
  }) async{
    try {
      return await _dio.post<T>(
        path,
        data: data,
        cancelToken: cancelToken,
        queryParameters: queryParameters,
        options: (options ?? Options()).copyWith(
          sendTimeout: const Duration(minutes: 5),
          receiveTimeout: const Duration(minutes: 2),
        ),
        onSendProgress: onSendProgress,
      );
    } on DioException catch (error) {
      throw DioExceptionMapper.map(error);
    }
  }
}
