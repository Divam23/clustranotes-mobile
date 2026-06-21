import 'package:clustranotes_mobile/features/comments/models/comment_model.dart';
import 'package:clustranotes_mobile/features/comments/presentation/widgets/comment_card/comment_replies/reply_card.dart';
import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';

class CommentReplies extends StatefulWidget {
  final List<Comment> replies;
  const CommentReplies({required this.replies, super.key});

  @override
  State<CommentReplies> createState() => _CommentRepliesState();
}

class _CommentRepliesState extends State<CommentReplies> {
  late bool _showAllReplies = false;

  @override
  Widget build(BuildContext context) {
    final visibleReplies = _showAllReplies
        ? widget.replies
        : widget.replies.take(0).toList();
    return Container(
      padding: EdgeInsets.only(left: AppSpacing.xxl),
      child: Column(
        children: [
          Column(
            children: visibleReplies
                .map(
                  (reply) => Padding(
                    padding: const EdgeInsets.only(left: AppSpacing.xxl),
                    child: ReplyCard(reply: reply),
                  ),
                )
                .toList(),
          ),
          if (widget.replies.isNotEmpty) ...[
            Align(
              alignment: Alignment.centerLeft,
              
              child: Padding(
                padding: const EdgeInsets.only(left:AppSpacing.xxl),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    overlayColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    
                  ),
                  
                  onPressed: () {
                    setState(() {
                      _showAllReplies = !_showAllReplies;
                    });
                  },
                  child: Text(
                    _showAllReplies
                        ? 'Hide Replies'
                        : 'View ${widget.replies.length} more replies',
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
