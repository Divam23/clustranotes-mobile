// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPreferencesDto _$UserPreferencesDtoFromJson(Map<String, dynamic> json) =>
    UserPreferencesDto(
      theme: $enumDecode(_$UserThemeEnumMap, json['theme']),
      language: json['language'] as String,
      notifications: UserNotificationPreferencesDto.fromJson(
        json['notifications'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$UserPreferencesDtoToJson(UserPreferencesDto instance) =>
    <String, dynamic>{
      'language': instance.language,
      'theme': _$UserThemeEnumMap[instance.theme]!,
      'notifications': instance.notifications,
    };

const _$UserThemeEnumMap = {
  UserTheme.light: 'light',
  UserTheme.dark: 'dark',
  UserTheme.system: 'system',
};
