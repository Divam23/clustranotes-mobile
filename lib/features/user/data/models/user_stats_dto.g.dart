// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStatsDto _$UserStatsDtoFromJson(Map<String, dynamic> json) => UserStatsDto(
  reputationScore: (json['reputationScore'] as num).toInt(),
  notesUploadedCount: (json['notesUploadedCount'] as num).toInt(),
  totalDownloads: (json['totalDownloads'] as num).toInt(),
  totalViews: (json['totalViews'] as num).toInt(),
  followersCount: (json['followersCount'] as num).toInt(),
  followingCount: (json['followingCount'] as num).toInt(),
);

Map<String, dynamic> _$UserStatsDtoToJson(UserStatsDto instance) =>
    <String, dynamic>{
      'reputationScore': instance.reputationScore,
      'notesUploadedCount': instance.notesUploadedCount,
      'totalDownloads': instance.totalDownloads,
      'totalViews': instance.totalViews,
      'followersCount': instance.followersCount,
      'followingCount': instance.followingCount,
    };
