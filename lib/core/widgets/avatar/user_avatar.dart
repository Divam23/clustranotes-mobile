import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget{
  final String avatar;
  const UserAvatar({
    required this.avatar,super.key
  });
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: AppRadius.avatar
      ),
      child: ClipRRect(
        borderRadius: AppRadius.avatar,
        child: Image.network(
            avatar,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
        ),
      )
    );
  }
}
