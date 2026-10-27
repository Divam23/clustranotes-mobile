// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_status_stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteStatusStatsDto _$NoteStatusStatsDtoFromJson(Map<String, dynamic> json) =>
    NoteStatusStatsDto(
      total: (json['total'] as num).toInt(),
      draft: (json['draft'] as num).toInt(),
      published: (json['published'] as num).toInt(),
      archived: (json['archived'] as num).toInt(),
      removed: (json['removed'] as num).toInt(),
      deleted: (json['deleted'] as num).toInt(),
      unverified: (json['unverified'] as num).toInt(),
      pendingReview: (json['pendingReview'] as num).toInt(),
      rejected: (json['rejected'] as num).toInt(),
      verified: (json['verified'] as num).toInt(),
    );

Map<String, dynamic> _$NoteStatusStatsDtoToJson(NoteStatusStatsDto instance) =>
    <String, dynamic>{
      'total': instance.total,
      'draft': instance.draft,
      'published': instance.published,
      'archived': instance.archived,
      'removed': instance.removed,
      'deleted': instance.deleted,
      'unverified': instance.unverified,
      'pendingReview': instance.pendingReview,
      'rejected': instance.rejected,
      'verified': instance.verified,
    };
