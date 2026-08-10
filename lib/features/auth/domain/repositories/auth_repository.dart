import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRepository {
  Future<UserCredential> signInWithGoogle();
  Future<UserCredential> registerWithEmailAndPassword({required String email, required String password});
  Future<UserCredential> signInWithEmailAndPassword({required String email, required String password});
  Future<void> signOut();
}
