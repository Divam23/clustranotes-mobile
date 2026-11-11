import 'package:clustranotes_mobile/features/upload/data/mapper/pagination_model_dto_to_pagination_info_mapper.dart';
import 'package:clustranotes_mobile/features/upload/data/mapper/uploaded_note_dto_to_domain_note.mapper.dart';
import 'package:clustranotes_mobile/features/upload/data/models/uploaded_notes_list_response_dto.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_notes_list_response_model.dart';

class UploadedNoteListDtoToDomainMapper {
  const UploadedNoteListDtoToDomainMapper._();

  static UploadedNotesListResponseModel uploadedNoteListMapper(
    UploadedNotesListResponseDto dto,
  ) {
    return UploadedNotesListResponseModel(
      notes: dto.notes.map(UploadedNoteMapper.uploadedNoteCardMapper).toList(),
      paginationInfo: PaginationModelDtoToPaginationInfoMapper.paginationInfoMapper(dto.pagination),
    );
  }
}
