class UserNotificationPreferences {
  final bool push;
  final bool email;
  final bool marketing;
  
  const UserNotificationPreferences({
    required this.email,
    required this.push,
    required this.marketing,
  });
}
