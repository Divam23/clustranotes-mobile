import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/core/utils/formatters/formatter.dart';
import 'package:clustranotes_mobile/features/comments/models/comment_model.dart';
import 'package:clustranotes_mobile/features/comments/presentation/widgets/comment_card/comment_card.dart';
import 'package:flutter/material.dart';

class CommentSection extends StatelessWidget {
  final List<Comment> comments;
  final ValueChanged<Comment> onReply;
  const CommentSection({required this.comments, required this.onReply, super.key});

  @override
  Widget build(BuildContext context) {
    final parentComments = comments.where((comment)=> comment.parentCommentId == null).toList();
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenPadding,
        vertical: AppSpacing.md,
      ),
      child: Column(
        spacing: AppSpacing.md,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Comments',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                NumberFormatter.labelWithCount(
                  count: parentComments.length,
                  singularLabel: 'comment',
                  pluralLabel: 'comments',
                ),
                style: theme.textTheme.titleSmall?.copyWith(color: theme.colorScheme.onSecondary),
              ),
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.xs,
              AppSpacing.sm,
              AppSpacing.xs,
              AppSpacing.sm,
            ),
            itemCount: parentComments.length,
            itemBuilder: (context, index) {
              final parentComment = parentComments[index];
              final replies = comments.where((comment)=>comment.parentCommentId == parentComment.id).toList();
              return CommentCard(
                parentComment: parentComment,
                replies: replies,
                onReply: onReply
              );
            },
            separatorBuilder: (_, __) =>
            const SizedBox(height: AppSpacing.lg),
          )
        ],
      ),
    );
  }
}
