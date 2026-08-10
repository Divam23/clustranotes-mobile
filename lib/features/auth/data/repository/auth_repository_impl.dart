import 'package:clustranotes_mobile/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:clustranotes_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource _remoteDataSource;
  AuthRepositoryImpl(this._remoteDataSource);
  
  @override
  Future<UserCredential> signInWithGoogle(){
    return _remoteDataSource.signInWithGoogle();
  }

  @override
  Future<UserCredential> registerWithEmailAndPassword({required String email, required String password}) {
    return _remoteDataSource.registerWithEmailAndPassword(email: email, password: password);
  }
  
  @override
  Future<UserCredential> signInWithEmailAndPassword({required String email, required String password}){
    return _remoteDataSource.signInWithEmailAndPassword(email: email, password: password);
  }
  
  @override
  Future<void> signOut(){
    return _remoteDataSource.signOut();
  }

}
