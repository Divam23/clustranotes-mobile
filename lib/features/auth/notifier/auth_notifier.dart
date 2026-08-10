import 'package:clustranotes_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:clustranotes_mobile/features/auth/notifier/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;
  AuthNotifier(this._repository) : super(const AuthState());

  Future<void> signInWithGoogle() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final userCredential = await _repository.signInWithGoogle();
      state = state.copyWith(isLoading: false, user: userCredential.user);
      debugPrint('UID: ${userCredential.user?.uid}');
      debugPrint('Email: ${userCredential.user?.email}');
    } catch (error, stackTrace) {
      debugPrint("Error while signing in: $error");
      debugPrintStack(stackTrace: stackTrace);
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
        user: null,
      );
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await _repository.signOut();
      state = state.copyWith(error: null);
      state = const AuthState();
    } catch (error, stackTrace) {
      debugPrint("Error logging out: $error");
      debugPrintStack(stackTrace: stackTrace);
      state = state.copyWith(error: error.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final credential = await _repository.registerWithEmailAndPassword(
        email: email,
        password: password,
      );

      state = state.copyWith(error: null, user: credential.user);
    } catch (error) {
      state = state.copyWith(error: error.toString(), user: null);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
  
  Future<void> signIn({
    required String email,
    required String password
  }) async{
    state = state.copyWith(isLoading: true, error: null);
    try{
      final credential = await _repository.signInWithEmailAndPassword(email: email, password: password);
      state = state.copyWith(error: null, user: credential.user);
    }
    catch (error) {
      state = state.copyWith(error: error.toString(), user: null);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
