import 'package:clustranotes_mobile/features/comments/data/dummy_comment_data.dart';
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
import 'package:flutter/material.dart';

class NoteDetailsScreen extends StatelessWidget{
  const NoteDetailsScreen({
    super.key,
  });
  
  
  @override
  Widget build(BuildContext context){
    final note = dummyNotes[0];
    final noteComments = dummyComments.where((comment)=> comment.noteId == note.id).toList();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            NoteDetailsAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    NotePreviewSection(note: note),
                    NoteInfoSection(note: note),
                    NoteEngagementSection(note: note),
                    NoteActionSection(),
                    NoteDescriptionSection(description: note.description),
                    NoteTagsSection(tags: note.tags),
                    RelatedNotesSection(notes: dummyNotes),
                    CommentSection(comments: noteComments),
                  ],
                ),
              ),
            ),
            CommentInputBar(),
          ],
        )
      ),
    );
  }
}
