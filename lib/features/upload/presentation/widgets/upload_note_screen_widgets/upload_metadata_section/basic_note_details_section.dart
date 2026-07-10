
import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/note_metadata_textfield.dart';
import 'package:flutter/material.dart';

class BasicNoteDetailsSection extends StatelessWidget{
  const BasicNoteDetailsSection({super.key});
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.md,
      children: [
        Text(
          "Basic Details",
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Column(
          spacing: AppSpacing.xl,
          children: [
            NoteMetadataTextField(label: "Title", required: true, hintText: "",),
            NoteMetadataTextField(label: "Description", required: true, maxLines: 5,keyboardType: TextInputType.multiline, ),
          ],
        )
      ],
    );
  } 
}
