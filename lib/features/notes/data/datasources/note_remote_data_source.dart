import 'dart:io';

import 'package:clustranotes_mobile/core/api/client/api_client.dart';
import 'package:clustranotes_mobile/features/notes/data/constants/note_api_endpoints.dart';
import 'package:clustranotes_mobile/features/notes/data/models/create_note_dto.dart';
import 'package:clustranotes_mobile/features/notes/data/models/create_note_response_dto.dart';
import 'package:dio/dio.dart';

class NoteRemoteDataSource {
  final ApiClient _apiClient;

  NoteRemoteDataSource(this._apiClient);

  Future<CreateNoteResponseDto> createNote({
    required CreateNoteDto note,
    required File file,
    void Function(int sent, int total)? onSendProgress
  }) async {
    final multipartFile = MultipartFile.fromFile(file.path);

    final formData = FormData.fromMap({
      ...note.toJson(),
      'file': await multipartFile,
    });
    
    print("Form Data: ${formData.fields}");

    final response = await _apiClient.postMultipart<Map<String, dynamic>>(
      path: NoteApiEndpoints.createNote,
      data: formData,
      onSendProgress: onSendProgress
    );
    
    final responseData = response.data?['data'];
    
    return CreateNoteResponseDto.fromJson(
      responseData as Map<String, dynamic>
    );
  }
}
