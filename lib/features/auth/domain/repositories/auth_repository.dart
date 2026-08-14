import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRepository {
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
  
  Future<void> sendEmailVerificationLink();
  
  Future<bool> checkEmailVerification();
  
  Future<void> forgotPassword({
    required String email
  });
  
  
  Future<void> signOut();
}
