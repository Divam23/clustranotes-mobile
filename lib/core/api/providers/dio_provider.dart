import 'package:clustranotes_mobile/core/api/config/api_endpoints.dart';
import 'package:clustranotes_mobile/core/api/interceptor/auth_interceptor.dart';
import 'package:clustranotes_mobile/core/api/interceptor/logger_interceptor.dart';
import 'package:clustranotes_mobile/core/firebase/provider/firebase_auth_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref){
  final auth = ref.read(firebaseAuthProvider);
  
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      responseType: ResponseType.json,
      headers: {
        'Accept': 'application/json',
        'Content-Type': "application/json",
      },
    ),
  );
  
  //Auth Interceptor
  dio.interceptors.add(
    AuthInterceptor(auth)
  );
  
  //Logger Interceptor
  dio.interceptors.add(
      LoggerInterceptor.create()
  );
  
  return dio;
});
