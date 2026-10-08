// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_note_stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadedNoteStatsDto _$UploadedNoteStatsDtoFromJson(
  Map<String, dynamic> json,
) => UploadedNoteStatsDto(
  viewsCount: (json['viewsCount'] as num).toInt(),
  downloadCount: (json['downloadCount'] as num).toInt(),
  ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
  ratingsCount: (json['ratingsCount'] as num).toInt(),
  likesCount: (json['likesCount'] as num).toInt(),
  bookmarksCount: (json['bookmarksCount'] as num).toInt(),
);

Map<String, dynamic> _$UploadedNoteStatsDtoToJson(
  UploadedNoteStatsDto instance,
) => <String, dynamic>{
  'viewsCount': instance.viewsCount,
  'downloadCount': instance.downloadCount,
  'ratingsAverage': instance.ratingsAverage,
  'ratingsCount': instance.ratingsCount,
  'likesCount': instance.likesCount,
  'bookmarksCount': instance.bookmarksCount,
};
