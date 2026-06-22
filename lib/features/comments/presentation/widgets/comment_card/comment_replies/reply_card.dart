import 'package:clustranotes_mobile/features/comments/models/comment_model.dart';
import 'package:clustranotes_mobile/features/comments/presentation/widgets/comment_card/comment_actions.dart';
import 'package:clustranotes_mobile/features/comments/presentation/widgets/comment_card/comment_content.dart';
import 'package:clustranotes_mobile/features/comments/presentation/widgets/comment_card/comment_header.dart';
import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';

class ReplyCard extends StatelessWidget{
  final Comment reply;
  final ValueChanged<Comment>? onReply;
  const ReplyCard({required this.reply, this.onReply, super.key});

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        CommentHeader(comment: reply),
        const SizedBox(height: AppSpacing.sm,),
        CommentContent(comment: reply),
        const SizedBox(height: AppSpacing.md,),
        CommentActions(comment: reply, onReply: (){onReply?.call(reply);}),
        const SizedBox(height: AppSpacing.md,),
      ],
    );
  }
}
