import 'package:clustranotes_mobile/features/user/domain/enums/user_theme.dart';
import 'package:clustranotes_mobile/features/user/domain/models/user_notification_preferences.dart';

class UserPreferences {
  final String language;
  final UserTheme theme;
  final UserNotificationPreferences notifications;
  
  const UserPreferences({
    required this.language,
    required this.theme,
    required this.notifications
  });
}
