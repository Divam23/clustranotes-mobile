import 'package:clustranotes_mobile/core/api/providers/api_client_provider.dart';
import 'package:clustranotes_mobile/features/notes/domain/repositories/note_repository.dart';
import 'package:clustranotes_mobile/features/notes/providers/note_providers.dart';
import 'package:clustranotes_mobile/features/upload/data/datasource/upload_remote_datasource.dart';
import 'package:clustranotes_mobile/features/upload/data/repository/upload_repository_impl.dart';
import 'package:clustranotes_mobile/features/upload/domain/repositories/upload_repository.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_note/upload_notifier.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_note/upload_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final uploadRemoteDataSourceProvider = Provider<UploadRemoteDataSource>((ref) {
  final apiClient = ref.read(apiClientProvider);

  return UploadRemoteDataSource(apiClient);
});

final uploadRepositoryProvider = Provider<UploadRepository>((ref) {
  final remote = ref.read(uploadRemoteDataSourceProvider);
  return UploadRepositoryImpl(remote);
});

final uploadProvider = StateNotifierProvider<UploadNotifier, UploadState>((
    ref,
    ) {
  return UploadNotifier(ref.read(noteRepositoryProvider));
});
