import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/upload_source_enums.dart';
import 'package:clustranotes_mobile/features/upload/presentation/pages/upload_note_screen/selected_image_screen.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void showUploadFilePickerType(BuildContext context){
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    enableDrag: true,
    isDismissible: true,
    sheetAnimationStyle: AnimationStyle(duration: Duration(milliseconds: 300)),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.xxl)
        )
    ),
    builder: (_) => FractionallySizedBox(
      child: const ChooseFileForUploadPopup(),
    ),
  );
}

class ChooseFileForUploadPopup extends ConsumerWidget {
  const ChooseFileForUploadPopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final notifier = ref.read(uploadProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Choose Upload Source",
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "Select how you'd like to upload your notes.",
            style: theme.textTheme.bodyMedium,
          ),

          const SizedBox(height: 24),

          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () async {
              Navigator.pop(context, UploadSource.file);
              await notifier.pickDocument();
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: theme.dividerColor,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor:
                    theme.colorScheme.primary.withValues(alpha: .1),
                    child: Icon(
                      Icons.description_rounded,
                      color: theme.colorScheme.primary,
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Document",
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "PDF, DOC, DOCX, PPT, PPTX",
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),

                  const Icon(AppIcons.rightArrow),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () async {
              await ref.read(uploadProvider.notifier).pickImages();
              if (!context.mounted) return;
              if (ref.read(uploadProvider).selectedImages.isNotEmpty) {
                Navigator.pop(context, UploadSource.images);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SelectedImageScreen(),
                  ),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: theme.dividerColor,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor:
                    theme.colorScheme.primary.withValues(alpha: .1),
                    child: Icon(
                      Icons.photo_library_rounded,
                      color: theme.colorScheme.primary,
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Images",
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Convert multiple images into a PDF",
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),

                  const Icon(AppIcons.rightArrow),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
