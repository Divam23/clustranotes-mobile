import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/avatar/avatar.dart';
import 'package:clustranotes_mobile/features/comments/models/comment_model.dart';
import 'package:clustranotes_mobile/features/comments/models/user_summary.dart';
import 'package:clustranotes_mobile/features/comments/presentation/widgets/comment_card/comment_input_field.dart';
import 'package:flutter/material.dart';

class CommentInputBar extends StatefulWidget{
  final UserSummary currentUser;
  final Comment? replyingTo;
  final VoidCallback onCancelReply;
  final FocusNode focusNode;
  final TextEditingController commentController;
  const CommentInputBar({required this.currentUser, required this.onCancelReply, required this.focusNode, required this.replyingTo, required this.commentController, super.key});

  @override
  State<CommentInputBar> createState() => _CommentInputBarState();
}

class _CommentInputBarState extends State<CommentInputBar> {
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero
      ),
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm, horizontal: AppSpacing.md ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.replyingTo != null)
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Replying to @${widget.replyingTo!.user.userName}',
                  ),
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  constraints: const BoxConstraints(),
                  onPressed: widget.onCancelReply,
                  icon: const Icon(AppIcons.close),
                ),
              ],
            ),
          Row(
            spacing: 10,
            children: [
              AppAvatar(avatar: widget.currentUser.avatarUrl, firstName: widget.currentUser.firstName),
              Expanded(child: CommentFieldInput(replyingTo: widget.replyingTo, focusNode: widget.focusNode, controller: widget.commentController,)),
              IconButton(onPressed: (){}, icon: Icon(AppIcons.send))
            ],
          ),
        ],
      ),
    );
  }
}
