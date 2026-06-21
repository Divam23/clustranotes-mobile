import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/core/widgets/note_tags.dart';
import 'package:flutter/material.dart';

class NoteTagsSection extends StatelessWidget{
  final List<String> tags;
  const NoteTagsSection({
    required this.tags, super.key
  });
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm, horizontal: AppSpacing.screenPadding),
      child: Column(
        spacing: AppSpacing.md,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'TAGS',
            style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.onSecondary
            ),
          ),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            runAlignment: WrapAlignment.start,
            children: [
              ...tags.map(
                (String tag){
                  return NoteTag(tag: tag);    
                }
              )
            ],
          ),
        ],
      ),
    );
  }
}
