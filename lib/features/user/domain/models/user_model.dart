
import 'package:clustranotes_mobile/features/user/domain/enums/user_enums.dart';
import 'package:clustranotes_mobile/features/user/domain/enums/user_role_enums.dart';
import 'package:clustranotes_mobile/features/user/domain/models/user_avatar.dart';
import 'package:clustranotes_mobile/features/user/domain/models/user_preferences.dart';
import 'package:clustranotes_mobile/features/user/domain/models/user_stats.dart';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String userName;
  
  final UserAvatarModel avatar;
  
  final String bio;
  final String college;
  final String course;
  final List<String> subjects;
  final String university;
  final int? semester;
  
  final List<UserRole> roles;
  final UserVerificationStatus verificationStatus;
  
  final UserPreferences preferences;
  final UserStats stats;
  
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserModel({
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
}
