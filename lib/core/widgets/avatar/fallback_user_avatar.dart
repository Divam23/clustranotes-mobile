import 'package:clustranotes_mobile/app/theme/app_radius.dart';
import 'package:flutter/material.dart';

class FallbackUserAvatar extends StatelessWidget{
  final String firstName;
  const FallbackUserAvatar({required this.firstName, super.key});
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: AppRadius.searchBarRounded
      ),
      child: Center(
        child: Text(
          firstName.substring(0,1).toUpperCase(),
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.surface,
          ),
        ),
      ),
      
    );
  }
}
