import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_metadata_section/academic_details_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_metadata_section/basic_note_details_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_metadata_section/note_classification_section.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();
class UploadNoteMetadataSection extends StatelessWidget {
  const UploadNoteMetadataSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.sm,
      children: [
        Text(
          "Upload Metadata",
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.start,
        ),
        Form(
          key: _formKey,
          child: Column(
            
            children: [
              BasicNoteDetailsSection(),
              const SizedBox(height: AppSpacing.section),
              AcademicDetailsSection(),
              const SizedBox(height: AppSpacing.section),
              NoteClassificationSection()
            ],
          ),
        )
      ],
    );
  }
}
