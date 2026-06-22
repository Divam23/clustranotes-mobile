import 'package:clustranotes_mobile/core/widgets/avatar/fallback_user_avatar.dart';
import 'package:clustranotes_mobile/core/widgets/avatar/user_avatar.dart';
import 'package:flutter/material.dart';

class AppAvatar extends StatelessWidget{
  final String? avatar;
  final String firstName;
  const AppAvatar({required this.avatar, required this.firstName, super.key});
  
  @override
  Widget build(BuildContext context){
    return avatar != null && avatar!.isNotEmpty ? UserAvatar(avatar: avatar!) : FallbackUserAvatar(firstName: firstName);
  }
}
