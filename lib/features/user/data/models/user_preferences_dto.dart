import 'package:clustranotes_mobile/features/user/data/models/user_notification_preferences_dto.dart';
import 'package:clustranotes_mobile/features/user/domain/enums/user_theme.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_preferences_dto.g.dart';

@JsonSerializable()
class UserPreferencesDto {
  final String language;
  final UserTheme theme;
  final UserNotificationPreferencesDto notifications;
  
  const UserPreferencesDto({
    required this.theme,  
    required this.language,  
    required this.notifications,  
  });
  
  factory UserPreferencesDto.fromJson(Map<String,dynamic> json) => _$UserPreferencesDtoFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserPreferencesDtoToJson(this);
}
