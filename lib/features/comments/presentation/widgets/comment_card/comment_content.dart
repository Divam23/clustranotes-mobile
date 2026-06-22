import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/comments/models/comment_model.dart';
import 'package:flutter/material.dart';

class CommentContent extends StatefulWidget {
  final Comment comment;
  const CommentContent({required this.comment, super.key});

  @override
  State<CommentContent> createState() => _CommentContentState();
}

class _CommentContentState extends State<CommentContent> {
  bool _isExpanded = false;

  void _toggleExpandedDescription() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasReplyingUser = widget.comment.replyingToUser?.userName != null;
    final isLongText = widget.comment.content.length > 120;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: AppSpacing.xxl),
        child: GestureDetector(
          onTap: _toggleExpandedDescription,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                maxLines: _isExpanded ? null : 5,
                overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                text: TextSpan(
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSecondary,
                  ),
                  children: [
                    if (hasReplyingUser)
                      TextSpan(
                        text: '@${widget.comment.replyingToUser!.userName} ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    TextSpan(text: widget.comment.content),
                  ],
                ),
              ),
              if (isLongText)
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    overlayColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: _toggleExpandedDescription,
                  child: Text(_isExpanded ? "Show less" : "Show more"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

