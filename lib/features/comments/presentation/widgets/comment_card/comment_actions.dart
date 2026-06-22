import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/button/social_engagement_buttons/like.dart';
import 'package:clustranotes_mobile/features/comments/models/comment_model.dart';
import 'package:flutter/material.dart';

class CommentActions extends StatefulWidget{
  final Comment comment;
  final VoidCallback? onReply;
  const CommentActions({required this.comment, this.onReply, super.key});
  
  @override
  State<CommentActions> createState() => _CommentActionState();
}

class _CommentActionState extends State<CommentActions> {
  late bool _isLiked = widget.comment.isLiked;
  _toggleIsLiked(){
    setState(() {
      _isLiked = !_isLiked;
    });
  }
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(left:AppSpacing.xxl),
      child: Row(
        spacing: AppSpacing.md,
        children: [
          AppLike(
            isLiked: _isLiked,
            onTap: _toggleIsLiked,
            count: widget.comment.likesCount,
            size: 15,
          ),
            TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  overlayColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
              ),
              onPressed: widget.onReply,
              child: Text(
                'Reply',
                  style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.dividerColor
                ),
              )
            )
          
          
        ],
      ),
    );
  }
}
