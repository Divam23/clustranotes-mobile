import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/button/social_engagement_buttons/comment.dart';
import 'package:clustranotes_mobile/core/widgets/button/social_engagement_buttons/like.dart';
import 'package:clustranotes_mobile/core/widgets/views.dart';
import 'package:clustranotes_mobile/features/notes/models/note_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoteEngagementSection extends StatelessWidget {
  final NoteDetails note;
  const NoteEngagementSection({required this.note, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
      child: Row(
        spacing: AppSpacing.sm,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: AppSpacing.sm,
                horizontal: AppSpacing.md,
              ),
              decoration: BoxDecoration(
              color: theme.colorScheme.surface,
                borderRadius: AppRadius.button,
              ),
              child: AppLike(
                isLiked: false,
                onTap: () async {
                  if (kDebugMode) {
                    print("Liked");
                  }
                  await HapticFeedback.lightImpact();
                },
                count: note.note.stats.likesCount,
                size: 25,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: AppSpacing.sm,
                horizontal: AppSpacing.md,
              ),
              decoration: BoxDecoration(
                borderRadius: AppRadius.button,
                color: theme.colorScheme.surface,
              ),
              child: AppComment(
                onTap: () {},
                count: note.note.stats.commentsCount,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: AppSpacing.sm,
                horizontal: AppSpacing.md,
              ),
              
              decoration: BoxDecoration(
                borderRadius: AppRadius.button,
                color: theme.colorScheme.surface,
                
              ),
              child: AppViews(count: note.note.stats.viewsCount),
            ),
          ),
        ],
      ),
    );
  }
}
