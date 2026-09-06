import 'package:clustranotes_mobile/core/api/providers/api_client_provider.dart';
import 'package:clustranotes_mobile/features/notes/data/datasources/note_remote_data_source.dart';
import 'package:clustranotes_mobile/features/notes/data/repositories/note_repository_impl.dart';
import 'package:clustranotes_mobile/features/notes/domain/repositories/note_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final noteRemoteDataSourceProvider = Provider<NoteRemoteDataSource>((ref){
  return NoteRemoteDataSource(ref.read(apiClientProvider));
});

final noteRepositoryProvider = Provider<NoteRepository>((ref){
  return NoteRepositoryImpl(ref.read(noteRemoteDataSourceProvider));
});

