// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseDto _$UserResponseDtoFromJson(Map<String, dynamic> json) =>
    UserResponseDto(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      userName: json['userName'] as String,
      avatar: UserAvatarDto.fromJson(json['avatar'] as Map<String, dynamic>),
      bio: json['bio'] as String,
      college: json['college'] as String,
      course: json['course'] as String,
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      university: json['university'] as String,
      semester: (json['semester'] as num?)?.toInt(),
      roles: (json['roles'] as List<dynamic>)
          .map((e) => $enumDecode(_$UserRoleEnumMap, e))
          .toList(),
      verificationStatus: $enumDecode(
        _$UserVerificationStatusEnumMap,
        json['verificationStatus'],
      ),
      preferences: UserPreferencesDto.fromJson(
        json['preferences'] as Map<String, dynamic>,
      ),
      stats: UserStatsDto.fromJson(json['stats'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UserResponseDtoToJson(UserResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'userName': instance.userName,
      'avatar': instance.avatar,
      'bio': instance.bio,
      'college': instance.college,
      'course': instance.course,
      'subjects': instance.subjects,
      'university': instance.university,
      'semester': instance.semester,
      'roles': instance.roles.map((e) => _$UserRoleEnumMap[e]!).toList(),
      'verificationStatus':
          _$UserVerificationStatusEnumMap[instance.verificationStatus]!,
      'preferences': instance.preferences,
      'stats': instance.stats,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.student: 'student',
  UserRole.teacher: 'teacher',
  UserRole.lecturer: 'lecturer',
  UserRole.teachingAssistant: 'teachingAssistant',
  UserRole.postgraduateStudent: 'postgraduateStudent',
  UserRole.alumni: 'alumni',
  UserRole.guest: 'guest',
};

const _$UserVerificationStatusEnumMap = {
  UserVerificationStatus.notVerified: 'not_verified',
  UserVerificationStatus.verified: 'verified',
  UserVerificationStatus.underVerification: 'under_verification',
  UserVerificationStatus.verificationFailed: 'verification_failed',
};
