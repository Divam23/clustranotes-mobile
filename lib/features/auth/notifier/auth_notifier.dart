import 'dart:async';
import 'package:clustranotes_mobile/features/auth/domain/enum/auth_action_enum.dart';
import 'package:clustranotes_mobile/features/auth/domain/enum/backend_auth_status.dart';
import 'package:clustranotes_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:clustranotes_mobile/features/auth/notifier/auth_state.dart';
import 'package:clustranotes_mobile/features/user/domain/repositories/user_repository.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  Timer? _verificationCooldownTimer;
  StreamSubscription<User?>? _authStateSubscription;

  AuthNotifier(this._authRepository, this._userRepository) : super(const AuthState()){_listenToAuthState();}
  
  
  void _listenToAuthState(){
    _authStateSubscription = _authRepository.authStateChanges().listen(
      (user) async{
        debugPrint("Auth state user: ${user?.email}");
        if(user == null){
          state = state.copyWith(
            firebaseUser: null,
            user: null,
            isInitializing: false,
            backendAuthStatus: BackendAuthStatus.idle
          ); 
          return;
        }
        state = state.copyWith(
          firebaseUser: user,
        );

        if (!user.emailVerified) {
          state = state.copyWith(
            user: null,
            isInitializing: false,
          );
          return;
        }
        
        await _authenticateWithBackend(user);
      },
      onError: (error, stackTrace){
        debugPrint("Error: $error");
        debugPrintStack(stackTrace: stackTrace);
          
        state = state.copyWith(
          isInitializing: false,
          error: error.toString(),
        );
      }
    );
  }

  bool _isAuthenticatingWithBackend = false;
  Future<void> _authenticateWithBackend(User user) async {
    if (_isAuthenticatingWithBackend) return;
    _isAuthenticatingWithBackend = true;
    try {
      final clustraUser = await _userRepository.authenticateUser();
      debugPrint("MongoDB User: $clustraUser");
      state = state.copyWith(
        user: clustraUser,
        backendAuthStatus: BackendAuthStatus.authenticated,
        error: null,
      );
    } catch (error, stackTrace) {
      debugPrint('Error authenticating user with backend: $error');
      debugPrintStack(stackTrace: stackTrace);
      state = state.copyWith(
        user: null,
        error: error.toString(),
        backendAuthStatus: BackendAuthStatus.failed,
      );
    } finally {
      _isAuthenticatingWithBackend = false;
      state = state.copyWith(isInitializing: false);
    }
  }

  Future<void> signInWithGoogle() async {
    state = state.copyWith(
      isLoading: true,
      loadingAction: AuthAction.googleSignIn,
      error: null,
    );
    try {
      final userCredential = await _authRepository.signInWithGoogle();
      state = state.copyWith(firebaseUser: userCredential.user);
    } catch (error, stackTrace) {
      debugPrint("Error while signing in: $error");
      debugPrintStack(stackTrace: stackTrace);
      state = state.copyWith(error: error.toString(), firebaseUser: null);
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
      final credential = await _authRepository.registerWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      _startVerificationCooldownTimer();
      state = state.copyWith(error: null, firebaseUser: credential.user);
      return true;
    } catch (error) {
      state = state.copyWith(error: error.toString(), firebaseUser: null);
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
      final credential = await _authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final firebaseUser = credential.user;
      
      if(firebaseUser == null){
        throw Exception('Firebase authentication returned no user');
      }
      
      state = state.copyWith(error: null, user: null, firebaseUser: firebaseUser);
    } catch (error,stackTrace) {
      debugPrint('Error while signing in: $error');
      debugPrintStack(stackTrace: stackTrace);
      state = state.copyWith(error: error.toString());
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
      await _authRepository.sendEmailVerificationLink();
      _startVerificationCooldownTimer();
      state = state.copyWith(error: null);
    } catch (error) {
      state = state.copyWith(error: error.toString());
    } finally {
      state = state.copyWith(isLoading: false, loadingAction: null);
    }
  }
  
  bool _isCheckingEmailVerification = false;
  Future<bool> checkEmailVerification() async {
    if (_isCheckingEmailVerification) return state.firebaseUser?.emailVerified ?? false;
    _isCheckingEmailVerification = true;
    state = state.copyWith(
      isLoading: true,
      loadingAction: AuthAction.checkVerification,
      error: null,
    );

    try {
      final user = await _authRepository.reloadCurrentUser();
      state = state.copyWith(firebaseUser: user, error: null);

      final isVerified = user?.emailVerified ?? false;
      if (isVerified && user != null) {
        await _authenticateWithBackend(user);
      }
      return isVerified;
    } catch (error) {
      state = state.copyWith(error: error.toString());
      return false;
    } finally {
      _isCheckingEmailVerification = false;
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
      await _authRepository.forgotPassword(email: email);
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
      await _authRepository.signOut();
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
    _isAuthenticatingWithBackend = false;
    _isCheckingEmailVerification = false;
    super.dispose();
  }
}
