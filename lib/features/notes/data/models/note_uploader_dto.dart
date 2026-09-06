import 'package:clustranotes_mobile/features/user/domain/enums/user_enums.dart';
import 'package:clustranotes_mobile/shared/models/user_avatar_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'note_uploader_dto.g.dart';

@JsonSerializable()
class NoteUploaderDto {
  final String id;
  final String firstName;
  final String lastName;
  final String userName;
  final UserAvatarDto avatar;
  final UserVerificationStatus userVerificationStatus;
  
  const NoteUploaderDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.avatar,
    required this.userVerificationStatus
  });
  
  factory NoteUploaderDto.fromJson(Map<String, dynamic> json) => _$NoteUploaderDtoFromJson(json);
  Map<String, dynamic> toJson() => _$NoteUploaderDtoToJson(this);
}
