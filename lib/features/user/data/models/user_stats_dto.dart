import 'package:json_annotation/json_annotation.dart';
part 'user_stats_dto.g.dart';

@JsonSerializable()
class UserStatsDto {
  final int reputationScore;
  final int notesUploadedCount;
  final int totalDownloads;
  final int totalViews;
  final int followersCount;
  final int followingCount;
  
  const UserStatsDto({
    required this.reputationScore,
    required this.notesUploadedCount,
    required this.totalDownloads,
    required this.totalViews,
    required this.followersCount,
    required this.followingCount,  
  });

  factory UserStatsDto.fromJson(
      Map<String, dynamic> json,
      ) => _$UserStatsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserStatsDtoToJson(this);
}
