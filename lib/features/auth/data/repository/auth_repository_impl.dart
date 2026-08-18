import 'package:clustranotes_mobile/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:clustranotes_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Stream<User?> authStateChanges(){
    return _remoteDataSource.authStateChange();
  }
  
  @override
  Future<UserCredential> signInWithGoogle() {
    return _remoteDataSource.signInWithGoogle();
  }
  
  @override
  Future<UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) {
    return _remoteDataSource.registerWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
    );
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _remoteDataSource.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
  
  @override
  Future<void> sendEmailVerificationLink()async{
    return _remoteDataSource.sendEmailVerificationLink();  
  }
  
  @override
  Future<User?> reloadCurrentUser() async{
    return _remoteDataSource.reloadCurrentUser();
  }
  
  @override
  Future<void> forgotPassword({
    required String email,
  })async{
    return _remoteDataSource.forgotPassword(email: email);
  }

  @override
  Future<void> signOut() {
    return _remoteDataSource.signOut();
  }
}
