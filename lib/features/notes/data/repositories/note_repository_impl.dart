import 'dart:io';

import 'package:clustranotes_mobile/features/notes/data/datasources/note_remote_data_source.dart';
import 'package:clustranotes_mobile/features/notes/data/mappers/create_note_response_to_note.mapper.dart';
import 'package:clustranotes_mobile/features/notes/data/models/create_note_dto.dart';
import 'package:clustranotes_mobile/features/notes/domain/repositories/note_repository.dart';
import 'package:clustranotes_mobile/features/notes/models/create_note_response_model.dart';
import 'package:clustranotes_mobile/features/notes/models/note_model.dart';
import 'package:dio/dio.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteRemoteDataSource _noteRemoteDataSource;
  NoteRepositoryImpl(this._noteRemoteDataSource);

  @override
  Future<CreateNoteResponseModel> createNote({
    required CreateNoteDto note,
    required File file,
    CancelToken? cancelToken,
    void Function(int sent, int total)? onSendProgress,
  }) async {
    final uploadedNote = await _noteRemoteDataSource.createNote(
      note: note,
      file: file,
      onSendProgress: onSendProgress,
      cancelToken: cancelToken
    );
    return NoteMapper.createNoteResponseToNote(uploadedNote);
  }
}
