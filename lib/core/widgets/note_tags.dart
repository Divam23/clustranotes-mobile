import 'package:clustranotes_mobile/app/theme/app_radius.dart';
import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class NoteTag extends StatelessWidget{
  final String tag;
  const NoteTag({
    required this.tag, super.key
  });
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical:AppSpacing.xs, horizontal: AppSpacing.md),
      decoration: BoxDecoration(
        borderRadius: AppRadius.chip,
        color: theme.colorScheme.primary.withValues(alpha: 0.2),
        border: Border.all(
          color: Theme.of(
            context,
          ).dividerColor.withValues(alpha: 0.3),
        ),
      ),
      child: Text(
        tag,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSecondary
        ),    
      ),
    );
  }
}
