import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;
  ApiClient(this._dio);
  
  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters 
  }){
    return _dio.get(
      path,
      queryParameters: queryParameters
    );
  }
  
  Future<Response<T>> post<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options
  }){
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options
    );
  }
  
  Future<Response<T>> put<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options
  }){
    return _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options
    );
  }
  
  Future<Response<T>> patch<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options
  }){
    return _dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options
    );
  }
  
  Future<Response<T>> delete<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options
  }){
    return _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options
    );
  }
  
  Future<Response<T>> postMultipart<T>({
    required String path,
    required FormData data,
    Map<String, dynamic>? queryParameters,
    void Function(int sent, int total)? onSendProgress,
    Options? options,
  }){
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: (options ?? Options()).copyWith(
        sendTimeout: const Duration(minutes: 5),
      ),
      onSendProgress: onSendProgress
    );
  }
}
