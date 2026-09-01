import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRepository {

  Stream<User?> authStateChanges();
  
  Future<UserCredential> signInWithGoogle();
  Future<UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  
  Future<Response<dynamic>> authenticateWithBackend();
  
  Future<void> sendEmailVerificationLink();
  
  Future<User?> reloadCurrentUser();

  
  Future<void> forgotPassword({
    required String email
  });
  
  
  Future<void> signOut();
}
