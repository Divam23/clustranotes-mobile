// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_uploader_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteUploaderDto _$NoteUploaderDtoFromJson(Map<String, dynamic> json) =>
    NoteUploaderDto(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      userName: json['userName'] as String,
      avatar: UserAvatarDto.fromJson(json['avatar'] as Map<String, dynamic>),
      userVerificationStatus: $enumDecode(
        _$UserVerificationStatusEnumMap,
        json['userVerificationStatus'],
      ),
    );

Map<String, dynamic> _$NoteUploaderDtoToJson(NoteUploaderDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'avatar': instance.avatar,
      'userVerificationStatus':
          _$UserVerificationStatusEnumMap[instance.userVerificationStatus]!,
    };

const _$UserVerificationStatusEnumMap = {
  UserVerificationStatus.notVerified: 'not_verified',
  UserVerificationStatus.verified: 'verified',
  UserVerificationStatus.underVerification: 'under_verification',
  UserVerificationStatus.verificationFailed: 'verification_failed',
};
