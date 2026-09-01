import 'package:clustranotes_mobile/core/api/providers/api_client_provider.dart';
import 'package:clustranotes_mobile/core/firebase/provider/firebase_auth_provider.dart';
import 'package:clustranotes_mobile/core/firebase/provider/google_sign_in_provider.dart';
import 'package:clustranotes_mobile/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:clustranotes_mobile/features/auth/data/repository/auth_repository_impl.dart';
import 'package:clustranotes_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:clustranotes_mobile/features/auth/notifier/auth_notifier.dart';
import 'package:clustranotes_mobile/features/auth/notifier/auth_state.dart';
import 'package:clustranotes_mobile/features/user/providers/user_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref){
  return AuthRemoteDataSource(ref.read(firebaseAuthProvider), ref.read(googleSignInProvider), ref.read(apiClientProvider));
}); 

final authRepositoryProvider = Provider<AuthRepository>((ref){
  return AuthRepositoryImpl(ref.read(authRemoteDataSourceProvider));
});

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref){
  return AuthNotifier(ref.read(authRepositoryProvider), ref.read(userRepositoryProvider));
});
