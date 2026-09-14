import 'package:json_annotation/json_annotation.dart';
part 'user_avatar_dto.g.dart';

@JsonSerializable()
class UserAvatarDto {
  final String? url;
  final String? storagePath;

  const UserAvatarDto({
    this.url,
    this.storagePath
  });

  factory UserAvatarDto.fromJson(Map<String, dynamic> json) => _$UserAvatarDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserAvatarDtoToJson(this);
}
