// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_note_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNoteResponseDto _$CreateNoteResponseDtoFromJson(
  Map<String, dynamic> json,
) => CreateNoteResponseDto(
  id: json['id'] as String,
  title: json['title'] as String,
  subject: json['subject'] as String,
  course: json['course'] as String,
  fileSize: (json['fileSize'] as num).toInt(),
  isPublic: json['isPublic'] as bool,
  publishedAt: json['publishedAt'] == null
      ? null
      : DateTime.parse(json['publishedAt'] as String),
);

Map<String, dynamic> _$CreateNoteResponseDtoToJson(
  CreateNoteResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'subject': instance.subject,
  'course': instance.course,
  'isPublic': instance.isPublic,
  'fileSize': instance.fileSize,
  'publishedAt': instance.publishedAt?.toIso8601String(),
};
