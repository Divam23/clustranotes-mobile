// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_notification_preferences_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserNotificationPreferencesDto _$UserNotificationPreferencesDtoFromJson(
  Map<String, dynamic> json,
) => UserNotificationPreferencesDto(
  email: json['email'] as bool,
  push: json['push'] as bool,
  marketing: json['marketing'] as bool,
);

Map<String, dynamic> _$UserNotificationPreferencesDtoToJson(
  UserNotificationPreferencesDto instance,
) => <String, dynamic>{
  'email': instance.email,
  'push': instance.push,
  'marketing': instance.marketing,
};
