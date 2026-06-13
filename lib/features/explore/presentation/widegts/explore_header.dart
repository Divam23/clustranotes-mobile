import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class ExploreHeader extends StatelessWidget{
  const ExploreHeader({super.key});
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context); 
    return Column(
      spacing: AppSpacing.xs,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Explore",
          style: theme.textTheme.displayLarge?.copyWith(
            
          )
        ),
        Text(
          "Discover academic resources from students.",
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onSecondary
          ),
        )
      ],
    );
  }
}
