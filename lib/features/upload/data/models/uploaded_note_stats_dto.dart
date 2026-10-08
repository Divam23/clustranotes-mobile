import 'package:json_annotation/json_annotation.dart';
part 'uploaded_note_stats_dto.g.dart';

@JsonSerializable()
class UploadedNoteStatsDto {
  final int viewsCount;
  final int downloadCount;
  final double ratingsAverage;
  final int ratingsCount;
  final int likesCount;
  final int bookmarksCount;

  const UploadedNoteStatsDto({
    required this.viewsCount,
    required this.downloadCount,
    required this.ratingsAverage,
    required this.ratingsCount,
    required this.likesCount,
    required this.bookmarksCount,
  });

  factory UploadedNoteStatsDto.fromJson(Map<String, dynamic> json) =>
      _$UploadedNoteStatsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UploadedNoteStatsDtoToJson(this);
}
