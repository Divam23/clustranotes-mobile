import 'package:clustranotes_mobile/features/upload/data/models/pagination_model_dto.dart';
import 'package:clustranotes_mobile/features/upload/data/models/uploaded_note_card_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'uploaded_notes_list_response_dto.g.dart';


@JsonSerializable()
class UploadedNotesListResponseDto {
  final List<UploadedNoteCardDto> notes;
  final PaginationModelDto pagination;
  const UploadedNotesListResponseDto({
    required this.notes,
    required this.pagination
  });
  factory UploadedNotesListResponseDto.fromJson(Map<String, dynamic> json) => _$UploadedNotesListResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UploadedNotesListResponseDtoToJson(this);
}
