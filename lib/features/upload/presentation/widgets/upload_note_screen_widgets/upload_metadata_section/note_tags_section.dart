import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/button/multi_utility_button.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/note_metadata_textfield.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteTagsSection extends ConsumerWidget {
  const NoteTagsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagController = TextEditingController();
    final theme = Theme.of(context);
    final notifier = ref.read(uploadProvider.notifier);
    final upload = ref.watch(uploadProvider);
    final hasReachedMaxTagLength = upload.tags.length >= 10;
    return Column(
      spacing: AppSpacing.lg,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppSpacing.xxs,
          children: [
            Text(
              "Tags",
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Add relevant tags to help others discover your note.",
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        Column(
          spacing: AppSpacing.sm,
          children: [
            NoteMetadataTextField(
              maxLength: 25,
              hintText: "Add relevant tags",
              enabled: upload.tags.length >= 10 ? false : true,
              keyboardType: TextInputType.text,
              controller: tagController,
              maxLines: 1,
              prefixIcon: Icon(
                AppIcons.hashtag,
                color: theme.disabledColor,
                applyTextScaling: true,
                size: 20,
              ),
              suffixIcon: MultiUtilityButton(
                onPressed: () {
                  hasReachedMaxTagLength
                      ? null
                      : notifier.addTags(tagController.text);
                  tagController.clear();
                },
                text: "Add",
                borderRadius: AppRadius.searchBarSharp.copyWith(
                  bottomLeft: Radius.zero,
                  topLeft: Radius.zero,
                ),
                buttonColor: theme.colorScheme.primary,
                buttonTextColor: theme.colorScheme.onPrimary,
              ),
              label: "Add Tag",
            ),
          ],
        ),
        if (upload.tags.isNotEmpty) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Tags Added (${upload.tags.length} / 10)',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Wrap(
                spacing: AppSpacing.sm,
                runAlignment: WrapAlignment.spaceAround,
                children: upload.tags.map((tag) {
                  return InputChip(
                    backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.9),
                    side: BorderSide.none,
                    deleteIconColor: theme.colorScheme.onPrimary,
                    label: Text(
                      textAlign: TextAlign.center, 
                      '#$tag',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.colorScheme.onPrimary
                      ),
                      textWidthBasis: TextWidthBasis.parent,
                      softWrap: true,
                      textScaler: TextScaler.noScaling,
                    ),
                    onDeleted: () {
                      notifier.removeTag(tag);
                    },
                  );
                }).toList(),
              ),
            ],
          ),
          
        ],
      ],
    );
  }
}
