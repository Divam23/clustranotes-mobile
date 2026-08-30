import 'package:clustranotes_mobile/features/user/domain/enums/user_enums.dart';
import 'package:clustranotes_mobile/features/user/domain/enums/user_role_enums.dart';

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
}
