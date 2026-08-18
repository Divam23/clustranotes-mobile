import 'dart:async';
import 'package:clustranotes_mobile/features/auth/domain/enum/auth_action_enum.dart';
import 'package:clustranotes_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:clustranotes_mobile/features/auth/notifier/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;
  Timer? _verificationCooldownTimer;
  StreamSubscription<User?>? _authStateSubscription;

  AuthNotifier(this._repository) : super(const AuthState()){_listenToAuthState();}
  
  
  void _listenToAuthState(){
    _authStateSubscription = _repository.authStateChanges().listen(
        (user){
          debugPrint("Auth state user: ${user?.email}");
          state = state.copyWith(
            user: user,
            isInitializing: false
          );
        },
      onError: (error, stackTrace){
        debugPrint("Error: $error");
        debugPrintStack(stackTrace: stackTrace);
          
        state = state.copyWith(
          isInitializing: false,
          error: error.toString()
        );
      }
    );
  }

  Future<void> signInWithGoogle() async {
    state = state.copyWith(
      isLoading: true,
      loadingAction: AuthAction.googleSignIn,
      error: null,
    );
    try {
      final userCredential = await _repository.signInWithGoogle();
      state = state.copyWith(user: userCredential.user);
    } catch (error, stackTrace) {
      debugPrint("Error while signing in: $error");
      debugPrintStack(stackTrace: stackTrace);
      state = state.copyWith(error: error.toString(), user: null);
    } finally {
      state = state.copyWith(isLoading: false, loadingAction: null);
    }
  }

  Future<bool> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    state = state.copyWith(
      isLoading: true,
      loadingAction: AuthAction.signUp,
      error: null,
    );

    try {
      final credential = await _repository.registerWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      _startVerificationCooldownTimer();
      state = state.copyWith(error: null, user: credential.user);
      return true;
    } catch (error) {
      state = state.copyWith(error: error.toString(), user: null);
      return false;
    } finally {
      state = state.copyWith(isLoading: false, loadingAction: null);
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    state = state.copyWith(
      isLoading: true,
      loadingAction: AuthAction.emailSignIn,
      error: null,
    );
    try {
      final credential = await _repository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = state.copyWith(error: null, user: credential.user);
    } catch (error) {
      state = state.copyWith(error: error.toString(), user: null);
    } finally {
      state = state.copyWith(isLoading: false, loadingAction: null);
    }
  }

  Future<void> resendEmailVerificationLink() async {
    if (state.verificationResendCooldown > 0) return;
    state = state.copyWith(
      isLoading: true,
      loadingAction: AuthAction.resendVerification,
      error: null,
    );

    try {
      await _repository.sendEmailVerificationLink();
      _startVerificationCooldownTimer();
      state = state.copyWith(error: null);
    } catch (error) {
      state = state.copyWith(error: error.toString());
    } finally {
      state = state.copyWith(isLoading: false, loadingAction: null);
    }
  }

  Future<bool> checkEmailVerification() async {
    state = state.copyWith(
      isLoading: true,
      loadingAction: AuthAction.checkVerification,
      error: null,
    );

    try {
      final user = await _repository.reloadCurrentUser();
      state = state.copyWith( user: user, error: null);

      return user?.emailVerified ?? false;
    } catch (error) {
      state = state.copyWith(error: error.toString());
      return false;
    } finally {
      state = state.copyWith(isLoading: false, loadingAction: null);
    }
  }

  Future<void> forgotPassword({required String email}) async {
    state = state.copyWith(
      isLoading: true,
      loadingAction: AuthAction.forgotPassword,
      error: null,
    );
    try {
      await _repository.forgotPassword(email: email);
      state = state.copyWith(error: null);
    } catch (error) {
      state = state.copyWith(error: error.toString());
    } finally {
      state = state.copyWith(isLoading: false, loadingAction: null);
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(
      isLoading: true,
      loadingAction: AuthAction.signOut,
      error: null,
    );

    try {
      await _repository.signOut();
      state = state.copyWith(error: null);
    } catch (error, stackTrace) {
      debugPrint("Error logging out: $error");
      debugPrintStack(stackTrace: stackTrace);
      state = state.copyWith(error: error.toString());
    } finally {
      state = state.copyWith(isLoading: false, loadingAction: null);
    }
  }

  void _startVerificationCooldownTimer() {
    _verificationCooldownTimer?.cancel();

    state = state.copyWith(verificationResendCooldown: 45);

    _verificationCooldownTimer = Timer.periodic(const Duration(seconds: 1), (
      timer,
    ) {
      final remaining = state.verificationResendCooldown;
      if (remaining <= 1) {
        timer.cancel();

        state = state.copyWith(verificationResendCooldown: 0);

        return;
      }
      state = state.copyWith(verificationResendCooldown: remaining - 1);
    });
  }
  
  @override
  void dispose(){
    _authStateSubscription?.cancel();
    _verificationCooldownTimer?.cancel();
    super.dispose();
  }
}
