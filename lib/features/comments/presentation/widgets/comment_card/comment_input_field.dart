import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/comments/models/comment_model.dart';
import 'package:flutter/material.dart';

class CommentFieldInput extends StatefulWidget{

  final VoidCallback? onTap;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FocusNode focusNode;
  final Comment? replyingTo;
  
  const CommentFieldInput({
    this.onTap,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.replyingTo,
    required this.focusNode,
    super.key
  });

  @override
  State<CommentFieldInput> createState() => _CommentFieldInputState();
}

class _CommentFieldInputState extends State<CommentFieldInput> {
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return TextField(
      onTap: widget.onTap,
      controller: widget.controller,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      minLines: 1,
      maxLines: 4,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.send,
      focusNode: widget.focusNode,
      autocorrect: true,
      decoration: InputDecoration(
        hintText: widget.replyingTo != null ? 'Reply to @${widget.replyingTo!.user.userName}: ' :  "Share your thoughts...",
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: theme.disabledColor,
        ),
        border: theme.inputDecorationTheme.disabledBorder,
        contentPadding: EdgeInsets.symmetric(vertical: AppSpacing.xs, horizontal: AppSpacing.md)
      ),
    );
  }
}
