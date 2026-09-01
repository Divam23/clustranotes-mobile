import 'package:clustranotes_mobile/features/auth/domain/enum/auth_action_enum.dart';
import 'package:clustranotes_mobile/features/auth/domain/enum/auth_status_enum.dart';
import 'package:clustranotes_mobile/features/auth/domain/enum/backend_auth_status.dart';
import 'package:clustranotes_mobile/features/user/domain/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';


@freezed
abstract class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState({
    @Default(false) bool isLoading,
    @Default(true) bool isInitializing,
    @Default(BackendAuthStatus.idle)BackendAuthStatus backendAuthStatus,
    @Default(0) int verificationResendCooldown,
    AuthAction? loadingAction,
    User? firebaseUser,
    UserModel? user,
    String? error,
  }) = _AuthState;

  AuthStatus get status {
    if (isInitializing) {
      return AuthStatus.initializing;
    }

    if (firebaseUser == null) {
      return AuthStatus.unauthenticated;
    }

    if (!firebaseUser!.emailVerified) {
      return AuthStatus.emailUnverified;
    }
    
    switch(backendAuthStatus){
      case BackendAuthStatus.idle:
      case BackendAuthStatus.authenticating:
        return AuthStatus.authenticatingWithBackend;
        
      case BackendAuthStatus.failed:
        return AuthStatus.backendAuthenticationFailed;
        
      case BackendAuthStatus.authenticated:
        return AuthStatus.authenticated;
    }
    
  }
}

