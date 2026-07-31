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
    builder: (context) => FractionallySizedBox(
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
            borderRadius: AppRadius.card,
            onTap: () async {
              Navigator.pop(context, UploadSource.file);
              await notifier.pickDocument();
            },
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainer,
                  
                  borderRadius: AppRadius.card,
                  boxShadow: [
                    BoxShadow(
                      color: theme.shadowColor.withValues(alpha: 0.1),
                      offset: Offset(0, 1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      blurStyle: BlurStyle.normal,
                    ),
                  ]
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor:
                    theme.colorScheme.primary.withValues(alpha: .1),
                    child: Icon(
                      AppIcons.description,
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

          const SizedBox(height: AppSpacing.lg),

          InkWell(
            borderRadius: AppRadius.card,
            onTap: () async {
              await notifier.pickImages();
              if (!context.mounted) return;
              Navigator.pop(context, UploadSource.images);
              if (ref.read(uploadProvider).selectedImages.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return const SelectedImageScreen();
                    },
                  ),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainer,
                
                borderRadius: AppRadius.card,
                boxShadow: [
                  BoxShadow(
                    color: theme.shadowColor.withValues(alpha: 0.1),
                    offset: Offset(0, 1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    blurStyle: BlurStyle.normal,
                  ),
                ]
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
