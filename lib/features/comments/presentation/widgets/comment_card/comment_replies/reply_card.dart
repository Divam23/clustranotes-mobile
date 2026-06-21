import 'package:clustranotes_mobile/features/comments/models/comment_model.dart';
import 'package:clustranotes_mobile/features/comments/presentation/widgets/comment_card/comment_actions.dart';
import 'package:clustranotes_mobile/features/comments/presentation/widgets/comment_card/comment_content.dart';
import 'package:clustranotes_mobile/features/comments/presentation/widgets/comment_card/comment_header.dart';
import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';

class ReplyCard extends StatefulWidget{
  final Comment reply;
  const ReplyCard({required this.reply, super.key});

  @override
  State<ReplyCard> createState() => _ReplyCardState();
}

class _ReplyCardState extends State<ReplyCard> {
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        CommentHeader(comment: widget.reply),
        const SizedBox(height: AppSpacing.sm,),
        CommentContent(comment: widget.reply),
        const SizedBox(height: AppSpacing.md,),
        CommentActions(comment: widget.reply),
        const SizedBox(height: AppSpacing.md,),
      ],
    );
  }
}
