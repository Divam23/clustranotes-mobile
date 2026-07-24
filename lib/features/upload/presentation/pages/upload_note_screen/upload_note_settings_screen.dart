import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_metadata_section/note_classification_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_metadata_section/note_tags_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_note_settings/note_visibility_section.dart';
import 'package:flutter/material.dart';

class UploadNoteSettingsScreen extends StatelessWidget {

  const UploadNoteSettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NoteClassificationSection(),
              const SizedBox(height: AppSpacing.xl),
              NoteTagsSection(),
              const SizedBox(height: AppSpacing.xl),
              NoteVisibilitySection(),
            ],
          ),
        ),
      ],
    );
  }
}
