import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthInterceptor extends Interceptor{
  final FirebaseAuth _firebaseAuth;
  AuthInterceptor(this._firebaseAuth);
  
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler  
  ) async{
    try{
      final user = _firebaseAuth.currentUser;
      if(user == null){
        handler.next(options);
        return;
      }

      final token = await user.getIdToken();

      options.headers['Authorization'] = 'Bearer $token';

      handler.next(options);
    }
    catch(error){
      handler.reject(
        DioException(requestOptions: options, error: error)
      );
    }
   
  }
}
