// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_file_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteFileDto _$NoteFileDtoFromJson(Map<String, dynamic> json) => NoteFileDto(
  size: (json['size'] as num).toInt(),
  mimeType: json['mimeType'] as String,
  pageCount: (json['pageCount'] as num).toInt(),
  thumbnailUrl: json['thumbnailUrl'] as String?,
  canDownload: json['canDownload'] as bool,
  readingTime: (json['readingTime'] as num).toInt(),
);

Map<String, dynamic> _$NoteFileDtoToJson(NoteFileDto instance) =>
    <String, dynamic>{
      'size': instance.size,
      'mimeType': instance.mimeType,
      'pageCount': instance.pageCount,
      'canDownload': instance.canDownload,
      'readingTime': instance.readingTime,
      'thumbnailUrl': instance.thumbnailUrl,
    };
