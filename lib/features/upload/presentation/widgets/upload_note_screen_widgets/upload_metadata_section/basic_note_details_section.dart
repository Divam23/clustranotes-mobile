import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/note_metadata_textfield.dart';
import 'package:flutter/material.dart';

class BasicNoteDetailsSection extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final ValueChanged<String> handleTitleChange;
  final ValueChanged<String> handleDescriptionChange;

  const BasicNoteDetailsSection({
    required this.titleController,
    required this.handleTitleChange,
    required this.descriptionController,
    required this.handleDescriptionChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            NoteMetadataTextField(
              maxLength: 120,
              label: "Title",
              required: true,
              hintText: "",
              controller: titleController,
              onChanged: handleTitleChange,
              enabled: true,
              textInputAction: TextInputAction.done,
              validator: (value){
                if(value == null || value.trim().isEmpty){
                  return "Please enter a title";
                }
                return null;
              },
            ),
            NoteMetadataTextField(
              maxLength: 1000,
              label: "Description",
              required: true,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              controller: descriptionController,
              onChanged: handleDescriptionChange,
              enabled: true,
              textInputAction: TextInputAction.done,
              validator: (value){
                if(value == null || value.trim().isEmpty){
                  return "Please enter a description";
                }
                return null;
              },
            ),
          ],
        ),
      ],
    );
  }
}
