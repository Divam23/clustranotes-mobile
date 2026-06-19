import 'package:clustranotes_mobile/features/notes/data/note_details_dummy_data.dart';
import 'package:clustranotes_mobile/features/notes/presentation/widgets/note_action_section/note_action_section.dart';
import 'package:clustranotes_mobile/features/notes/presentation/widgets/note_desc_section/note_description_section.dart';
import 'package:clustranotes_mobile/features/notes/presentation/widgets/note_details_app_bar/note_details_app_bar.dart';
import 'package:clustranotes_mobile/features/notes/presentation/widgets/note_engagement_section/note_engagement_section.dart';
import 'package:clustranotes_mobile/features/notes/presentation/widgets/note_info_section/note_info_section.dart';
import 'package:clustranotes_mobile/features/notes/presentation/widgets/note_preview_section/note_preview_section.dart';
import 'package:flutter/material.dart';

class NoteDetailsScreen extends StatelessWidget{
  const NoteDetailsScreen({
    super.key,
  });
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            NoteDetailsAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    NotePreviewSection(note: dummyNotes[0]),
                    
                    NoteInfoSection(note: dummyNotes[0]),
                    NoteEngagementSection(note: dummyNotes[0]),
                    NoteActionSection(),
                    NoteDescriptionSection(description: dummyNotes[0].description),
                    // NoteTagsSection(),
                    // RelatedNoteSection(),
                    // CommentsSection(),
                  ],
                ),
              ),
            ),
            // CommentInputBar(),
          ],
        )
      ),
    );
  }
}
