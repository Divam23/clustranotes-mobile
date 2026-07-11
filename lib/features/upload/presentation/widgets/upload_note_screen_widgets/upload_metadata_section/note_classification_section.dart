import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/notes/models/note_enums.dart';
import 'package:clustranotes_mobile/features/upload/presentation/extension/note_category_enums_ui_showcase.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/common/show_selection_bottom_sheet.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/note_metadata_dropdown.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteClassificationSection extends ConsumerWidget {
  const NoteClassificationSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upload = ref.read(uploadProvider);
    final notifier = ref.read(uploadProvider.notifier);
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.md,
      children: [
        Text(
          "Classification",
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        NoteMetadataDropdown<NoteCategory>(
          label: "Category",
          hintText: "Lecture Notes/Assignment etc.",
          enabled: true,
          value: upload.noteCategory,
          itemLabelBuilder: (category) => category.displayName,
          onTap: () {
            showModalBottomSheet(
              useSafeArea: true,
              context: context,
              isScrollControlled: true,
              builder: (_) {
                return ShowSelectionBottomSheet(
                  title: "Select the category of note",
                  items: NoteCategory.values,
                  selectedItem: upload.noteCategory,
                  labelBuilder: (noteCategory) => noteCategory.displayName,
                  onSelected: notifier.updateNoteCategory,
                  allowClear: true,
                  onClear: () => notifier.updateNoteCategory(null),
                  hintText: "Search your categories here",
                );
              },
            );
          },
        ),
      ],
    );
  }
}
