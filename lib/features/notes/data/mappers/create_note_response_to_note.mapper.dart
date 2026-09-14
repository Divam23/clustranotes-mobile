import 'package:clustranotes_mobile/features/notes/data/models/create_note_response_dto.dart';
import 'package:clustranotes_mobile/features/notes/models/create_note_response_model.dart';

class NoteMapper{
  const NoteMapper._();
  static CreateNoteResponseModel createNoteResponseToNote(CreateNoteResponseDto dto) {
    return CreateNoteResponseModel(
      id: dto.id,
      title: dto.title,
      subject: dto.subject,
      course: dto.course,
      publishedAt: dto.publishedAt, 
      fileSize: dto.fileSize, 
      isPublic: dto.isPublic,
    );
  }
}


