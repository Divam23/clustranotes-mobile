import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/comments/models/comment_model.dart';
import 'package:clustranotes_mobile/features/comments/presentation/widgets/comment_card/comment_actions.dart';
import 'package:clustranotes_mobile/features/comments/presentation/widgets/comment_card/comment_content.dart';
import 'package:clustranotes_mobile/features/comments/presentation/widgets/comment_card/comment_header.dart';
import 'package:clustranotes_mobile/features/comments/presentation/widgets/comment_card/comment_replies/comment_replies.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  final Comment parentComment;
  final List<Comment> replies;
  const CommentCard({
    required this.parentComment,
    required this.replies,
    super.key
  });

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommentHeader(comment: widget.parentComment),
        const SizedBox(height: AppSpacing.sm,),
        CommentContent(comment: widget.parentComment),
        const SizedBox(height: AppSpacing.md,),
        CommentActions(comment: widget.parentComment),
        const SizedBox(height: AppSpacing.md,),
        if (
        widget.replies.isNotEmpty ||
            widget.parentComment.repliesCount > 0
        )
          CommentReplies(
            replies: widget.replies
          )
      ],
    );
  }
}
