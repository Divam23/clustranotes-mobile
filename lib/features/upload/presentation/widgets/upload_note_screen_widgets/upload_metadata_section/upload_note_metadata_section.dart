import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_metadata_section/academic_details_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_metadata_section/basic_note_details_section.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadNoteMetadataSection extends ConsumerStatefulWidget {

  const UploadNoteMetadataSection({super.key});

  @override
  ConsumerState<UploadNoteMetadataSection> createState() =>
      _UploadNoteMetadataSectionState();
}

class _UploadNoteMetadataSectionState
    extends ConsumerState<UploadNoteMetadataSection> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  late final upload = ref.watch(uploadProvider);
  late final notifier = ref.read(uploadProvider.notifier);

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: upload.title);
    _descriptionController = TextEditingController(text: upload.description);

    _titleController.addListener(() {
      notifier.updateTitle(_titleController.text);
    });
    
    _descriptionController.addListener(() {
      notifier.updateDescription(_descriptionController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.sm,
      children: [
        Text(
          "Metadata",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.start,
        ),
        Column(
          children: [
            BasicNoteDetailsSection(
              titleController: _titleController,
              descriptionController: _descriptionController,
              handleTitleChange: notifier.updateTitle,
              handleDescriptionChange: notifier.updateDescription,
            ),
            const SizedBox(height: AppSpacing.xxl),
            AcademicDetailsSection(),
            const SizedBox(height: AppSpacing.screenPadding),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
