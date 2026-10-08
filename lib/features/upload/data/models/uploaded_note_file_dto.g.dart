// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_note_file_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadedNoteFileDto _$UploadedNoteFileDtoFromJson(Map<String, dynamic> json) =>
    UploadedNoteFileDto(
      canDownload: json['canDownload'] as bool,
      thumbnailUrl: json['thumbnailUrl'] as String,
      pageCount: (json['pageCount'] as num).toInt(),
    );

Map<String, dynamic> _$UploadedNoteFileDtoToJson(
  UploadedNoteFileDto instance,
) => <String, dynamic>{
  'canDownload': instance.canDownload,
  'pageCount': instance.pageCount,
  'thumbnailUrl': instance.thumbnailUrl,
};
