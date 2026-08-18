import 'package:clustranotes_mobile/features/auth/domain/enum/auth_action_enum.dart';
import 'package:clustranotes_mobile/features/auth/domain/enum/auth_status_enum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';


@freezed
abstract class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState({
    @Default(false) bool isLoading,
    @Default(true) bool isInitializing,
    @Default(0) int verificationResendCooldown,
    AuthAction? loadingAction,
    User? user,
    String? error,
  }) = _AuthState;

  AuthStatus get status {
    if (isInitializing) {
      return AuthStatus.initializing;
    }

    if (user == null) {
      return AuthStatus.unauthenticated;
    }

    if (!user!.emailVerified) {
      return AuthStatus.emailUnverified;
    }

    return AuthStatus.authenticated;
  }
}

