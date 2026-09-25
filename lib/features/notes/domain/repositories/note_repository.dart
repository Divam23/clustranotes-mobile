import 'dart:io';
import 'package:clustranotes_mobile/features/notes/data/models/create_note_dto.dart';
import 'package:clustranotes_mobile/features/notes/models/create_note_response_model.dart';
import 'package:dio/dio.dart';

abstract interface class NoteRepository {
  Future<CreateNoteResponseModel> createNote({
    required CreateNoteDto note,
    required File file,
    CancelToken? cancelToken,
    void Function(int sent, int total)? onSendProgress,
  });
}
