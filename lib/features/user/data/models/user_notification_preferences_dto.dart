import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_notification_preferences_dto.g.dart';
@JsonSerializable()
class UserNotificationPreferencesDto {
  final bool email;
  final bool push;
  final bool marketing;
  
  const UserNotificationPreferencesDto({
    required this.email,
    required this.push,
    required this.marketing
  });
  
  factory UserNotificationPreferencesDto.fromJson(Map<String, dynamic> json) => _$UserNotificationPreferencesDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserNotificationPreferencesDtoToJson(this);
}
