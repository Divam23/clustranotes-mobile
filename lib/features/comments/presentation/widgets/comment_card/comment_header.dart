import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/utils/formatters/datetime_formatter.dart';
import 'package:clustranotes_mobile/core/widgets/avatar/fallback_user_avatar.dart';
import 'package:clustranotes_mobile/core/widgets/avatar/user_avatar.dart';
import 'package:clustranotes_mobile/core/widgets/verified_tick.dart';
import 'package:clustranotes_mobile/features/comments/models/comment_model.dart';
import 'package:flutter/material.dart';

class CommentHeader extends StatefulWidget{
  final Comment comment;
  const CommentHeader({required this.comment, super.key});

  @override
  State<CommentHeader> createState() => _CommentHeaderState();
}

class _CommentHeaderState extends State<CommentHeader> {
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Row(
            spacing: AppSpacing.xs,
            children: [
              widget.comment.user.avatarUrl != null
                  ? UserAvatar(avatar: widget.comment.user.avatarUrl!)
                  : FallbackUserAvatar(
                firstName: widget.comment.user.firstName,
              ),
              Text(
                '@${widget.comment.user.userName}',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              if (widget.comment.user.isIdentityVerified) ...[
                VerifiedTick(),
              ],
            ],
          ),
        ),
        Text(
          DateTimeFormatter.timeAgo(widget.comment.createdAt),
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.onSecondary,
          ),
        ),
      ],
    );
  }
}
