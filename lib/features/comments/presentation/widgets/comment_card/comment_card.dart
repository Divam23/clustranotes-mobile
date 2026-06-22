import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/comments/models/comment_model.dart';
import 'package:clustranotes_mobile/features/comments/presentation/widgets/comment_card/comment_actions.dart';
import 'package:clustranotes_mobile/features/comments/presentation/widgets/comment_card/comment_content.dart';
import 'package:clustranotes_mobile/features/comments/presentation/widgets/comment_card/comment_header.dart';
import 'package:clustranotes_mobile/features/comments/presentation/widgets/comment_card/comment_replies/comment_replies.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  final Comment parentComment;
  final List<Comment> replies;
  final ValueChanged<Comment> onReply;
  const CommentCard({
    required this.parentComment,
    required this.onReply,
    required this.replies,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommentHeader(comment: parentComment),
        const SizedBox(height: AppSpacing.sm,),
        CommentContent(comment: parentComment),
        const SizedBox(height: AppSpacing.md,),
        CommentActions(comment: parentComment, onReply: (){onReply(parentComment);},),
        const SizedBox(height: AppSpacing.md,),
        if (
        replies.isNotEmpty ||
            parentComment.repliesCount > 0
        )
          CommentReplies(
            replies: replies,
            onReply: onReply,
          )
      ],
    );
  }
}
