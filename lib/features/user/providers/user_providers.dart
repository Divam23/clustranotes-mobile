import 'package:clustranotes_mobile/core/api/providers/api_client_provider.dart';
import 'package:clustranotes_mobile/features/user/data/datasources/user_remote_data_source.dart';
import 'package:clustranotes_mobile/features/user/data/repositories/user_repository_impl.dart';
import 'package:clustranotes_mobile/features/user/domain/repositories/user_repository.dart';
import 'package:clustranotes_mobile/features/user/notifiers/user_notifier.dart';
import 'package:clustranotes_mobile/features/user/notifiers/user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>((ref){
  final apiClient = ref.read(apiClientProvider);
  
  return UserRemoteDataSource(apiClient);
});

final userRepositoryProvider = Provider<UserRepository>((ref){
  final remoteDataSource = ref.read(userRemoteDataSourceProvider);
  return UserRepositoryImpl(remoteDataSource);
});


final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>((ref){
  final repository = ref.read(userRepositoryProvider);
  return UserNotifier(repository);
});
