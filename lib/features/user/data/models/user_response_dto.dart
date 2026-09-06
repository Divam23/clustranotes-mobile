import 'package:clustranotes_mobile/features/user/data/models/user_preferences_dto.dart';
import 'package:clustranotes_mobile/features/user/data/models/user_stats_dto.dart';
import 'package:clustranotes_mobile/features/user/domain/enums/user_enums.dart';
import 'package:clustranotes_mobile/features/user/domain/enums/user_role_enums.dart';
import 'package:clustranotes_mobile/shared/models/user_avatar_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_response_dto.g.dart';

@JsonSerializable()
class UserResponseDto {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String userName;
  
  final UserAvatarDto avatar;
  
  final String bio;
  final String college;
  final String course;
  final List<String> subjects;
  final String university;
  final int? semester;
  
  final List<UserRole> roles;
  final UserVerificationStatus verificationStatus;
  
  final UserPreferencesDto preferences;
  final UserStatsDto stats;
  
  final DateTime createdAt;
  final DateTime updatedAt;
  
  const UserResponseDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userName,
    required this.avatar,
    required this.bio,
    required this.college,
    required this.course,
    required this.subjects,
    required this.university,
    required this.semester,
    required this.roles,
    required this.verificationStatus,
    required this.preferences,
    required this.stats,
    required this.createdAt,
    required this.updatedAt,
  });
  
  factory UserResponseDto.fromJson(Map<String, dynamic> json) => _$UserResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseDtoToJson(this);
}
