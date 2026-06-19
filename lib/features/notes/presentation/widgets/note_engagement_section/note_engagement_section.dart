import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/comment.dart';
import 'package:clustranotes_mobile/core/widgets/like.dart';
import 'package:clustranotes_mobile/core/widgets/views.dart';
import 'package:clustranotes_mobile/features/notes/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoteEngagementSection extends StatelessWidget{
  final Note note;
  const NoteEngagementSection({
    required this.note,
    super.key
  });
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
      child: Row(
        spacing: AppSpacing.sm,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical:AppSpacing.sm, horizontal: AppSpacing.md),
              decoration: BoxDecoration(
                borderRadius: AppRadius.button,
                border: Border.all(
                    color: theme.dividerColor.withValues(
                      alpha: 0.3,
                    ),
                  width: 1.5
                  ),
                ),
              child: AppLike(
                isLiked: false, 
                onTap: ()async{
                  print("Liked");
                  await HapticFeedback.lightImpact();
                }, 
                count: note.stats.likesCount
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical:AppSpacing.sm, horizontal: AppSpacing.md),
              decoration: BoxDecoration(
                borderRadius: AppRadius.button,
                border: Border.all(
                  color: theme.dividerColor.withValues(
                    alpha: 0.3,
                  ),
                  width: 1.5
                ),
              ),
              child: AppComment(onTap: (){}, count: note.stats.commentsCount),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical:AppSpacing.sm, horizontal: AppSpacing.md),
              decoration: BoxDecoration(
                borderRadius: AppRadius.button,
                border: Border.all(
                  color: theme.dividerColor.withValues(
                    alpha: 0.3,
                  ),
                  width: 1.5
                ),
              ),
              child: AppViews(count: note.stats.viewsCount),
            ),
          ),
        ],
      ),
    );
  }
}
