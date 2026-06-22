import 'package:clustranotes_mobile/features/comments/data/dummy_comment_data.dart';
import 'package:clustranotes_mobile/features/comments/models/comment_model.dart';
import 'package:clustranotes_mobile/features/comments/models/user_summary.dart';
import 'package:clustranotes_mobile/features/notes/data/note_details_dummy_data.dart';
import 'package:clustranotes_mobile/features/notes/presentation/widgets/comment_input_bar/comment_input_bar.dart';
import 'package:clustranotes_mobile/features/notes/presentation/widgets/comment_section/comment_section.dart';
import 'package:clustranotes_mobile/features/notes/presentation/widgets/note_action_section/note_action_section.dart';
import 'package:clustranotes_mobile/features/notes/presentation/widgets/note_desc_section/note_description_section.dart';
import 'package:clustranotes_mobile/features/notes/presentation/widgets/note_details_app_bar/note_details_app_bar.dart';
import 'package:clustranotes_mobile/features/notes/presentation/widgets/note_engagement_section/note_engagement_section.dart';
import 'package:clustranotes_mobile/features/notes/presentation/widgets/note_info_section/note_info_section.dart';
import 'package:clustranotes_mobile/features/notes/presentation/widgets/note_preview_section/note_preview_section.dart';
import 'package:clustranotes_mobile/features/notes/presentation/widgets/note_tags_section/note_tags_section.dart';
import 'package:clustranotes_mobile/features/notes/presentation/widgets/related_notes_section/related_notes_section.dart';
import 'package:clustranotes_mobile/features/user/data/dummy_user_data.dart';
import 'package:flutter/material.dart';

class NoteDetailsScreen extends StatefulWidget{
  const NoteDetailsScreen({
    super.key,
  });
  @override
  State<NoteDetailsScreen> createState() => _NoteDetailsScreenState();
  
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
  Comment? replyingTo;
  
  final FocusNode commentFocusNode = FocusNode();
  final TextEditingController _commentController = TextEditingController();
  
  void _onReply(Comment comment){
    setState(() {
      replyingTo = comment;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      commentFocusNode.requestFocus();
    });
    
    _commentController.text = '@${comment.user.userName} ';
    _commentController.selection = TextSelection.fromPosition(TextPosition(offset: _commentController.text.length));
    WidgetsBinding.instance.addPostFrameCallback((_){
      commentFocusNode.requestFocus();
    });
  }
  
  void _onCancel(){
    setState(() {
      replyingTo = null;
    });
    _commentController.text = '';
  }

  final UserSummary currentUser = dummyUsers.first;
  @override
  Widget build(BuildContext context){
    final note = dummyNotes[0];
    final noteComments = dummyComments.where((comment)=> comment.noteId == note.id).toList();
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: Column(
            children: [
              NoteDetailsAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    children: [
                      NotePreviewSection(note: note),
                      NoteInfoSection(note: note),
                      NoteEngagementSection(note: note),
                      NoteActionSection(),
                      NoteDescriptionSection(description: note.description),
                      NoteTagsSection(tags: note.tags),
                      RelatedNotesSection(notes: dummyNotes),
                      CommentSection(comments: noteComments, onReply: _onReply,),
                    ],
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    border: Border(
                      top: BorderSide(
                        color: theme.dividerColor.withValues(alpha: 0.3),
                      ),
                    ),
                  ),
                  child: CommentInputBar(
                    replyingTo: replyingTo,
                    currentUser: currentUser,
                    onCancelReply: _onCancel,
                    focusNode: commentFocusNode, commentController: _commentController,
                  )
              )
            ],
          )
        ),
      ),
      
    );
  }
  
  @override
  void dispose(){
    _commentController.dispose();
    commentFocusNode.dispose();
    super.dispose();
  }
}

