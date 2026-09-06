// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_note_response_stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNoteResponseStatsDto _$CreateNoteResponseStatsDtoFromJson(
  Map<String, dynamic> json,
) => CreateNoteResponseStatsDto(
  viewsCount: (json['viewsCount'] as num).toInt(),
  downloadCount: (json['downloadCount'] as num).toInt(),
  ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
  ratingsCount: (json['ratingsCount'] as num).toInt(),
  likesCount: (json['likesCount'] as num).toInt(),
  bookmarksCount: (json['bookmarksCount'] as num).toInt(),
);

Map<String, dynamic> _$CreateNoteResponseStatsDtoToJson(
  CreateNoteResponseStatsDto instance,
) => <String, dynamic>{
  'viewsCount': instance.viewsCount,
  'downloadCount': instance.downloadCount,
  'ratingsAverage': instance.ratingsAverage,
  'ratingsCount': instance.ratingsCount,
  'likesCount': instance.likesCount,
  'bookmarksCount': instance.bookmarksCount,
};
