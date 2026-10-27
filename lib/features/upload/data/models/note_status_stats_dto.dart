import 'package:json_annotation/json_annotation.dart';
part 'note_status_stats_dto.g.dart';

@JsonSerializable()
class NoteStatusStatsDto {
  final int total;
  final int draft;
  final int published;
  final int archived;
  final int removed;
  final int deleted;
  final int unverified;
  final int pendingReview;
  final int rejected;
  final int verified;

  const NoteStatusStatsDto({
    required this.total,
    required this.draft,
    required this.published,
    required this.archived,
    required this.removed,
    required this.deleted,
    required this.unverified,
    required this.pendingReview,
    required this.rejected,
    required this.verified,
  });

  factory NoteStatusStatsDto.fromJson(Map<String, dynamic> json) => _$NoteStatusStatsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$NoteStatusStatsDtoToJson(this);
}
