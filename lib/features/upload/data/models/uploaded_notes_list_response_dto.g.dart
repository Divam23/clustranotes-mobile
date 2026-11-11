// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_notes_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadedNotesListResponseDto _$UploadedNotesListResponseDtoFromJson(
  Map<String, dynamic> json,
) => UploadedNotesListResponseDto(
  notes: (json['notes'] as List<dynamic>)
      .map((e) => UploadedNoteCardDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: PaginationModelDto.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$UploadedNotesListResponseDtoToJson(
  UploadedNotesListResponseDto instance,
) => <String, dynamic>{
  'notes': instance.notes,
  'pagination': instance.pagination,
};
