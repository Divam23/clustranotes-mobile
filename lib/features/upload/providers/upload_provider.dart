import 'package:clustranotes_mobile/core/api/providers/api_client_provider.dart';
import 'package:clustranotes_mobile/features/upload/data/datasource/upload_remote_datasource.dart';
import 'package:clustranotes_mobile/features/upload/data/repository/upload_repository_impl.dart';
import 'package:clustranotes_mobile/features/upload/domain/repositories/upload_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final uploadRemoteDataSourceProvider = Provider<UploadRemoteDataSource>((ref) {
  final apiClient = ref.read(apiClientProvider);

  return UploadRemoteDataSource(apiClient);
});

final uploadRepositoryProvider = Provider<UploadRepository>((ref) {
  final remote = ref.read(uploadRemoteDataSourceProvider);
  return UploadRepositoryImpl(remote);
});

