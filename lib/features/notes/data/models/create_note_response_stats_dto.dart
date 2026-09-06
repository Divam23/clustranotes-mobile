import 'package:json_annotation/json_annotation.dart';
part 'create_note_response_stats_dto.g.dart';

@JsonSerializable()
class CreateNoteResponseStatsDto {
  final int viewsCount;
  final int downloadCount;
  final double ratingsAverage;
  final int ratingsCount;
  final int likesCount;
  final int bookmarksCount;

  const CreateNoteResponseStatsDto({
    required this.viewsCount,
    required this.downloadCount,
    required this.ratingsAverage,
    required this.ratingsCount,
    required this.likesCount,
    required this.bookmarksCount,
  });

  factory CreateNoteResponseStatsDto.fromJson(Map<String, dynamic> json) =>
      _$CreateNoteResponseStatsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateNoteResponseStatsDtoToJson(this);
}
