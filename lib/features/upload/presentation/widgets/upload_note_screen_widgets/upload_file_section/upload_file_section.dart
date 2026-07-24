import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_file_section/selected_file_card.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_file_section/upload_file_placeholder.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadFileSection extends ConsumerWidget {
  final VoidCallback onTap;
  final bool isGeneratingPDF;
  final bool isPickingImages;
  const UploadFileSection({
    required this.onTap,
    required this.isGeneratingPDF,
    required this.isPickingImages,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upload = ref.watch(uploadProvider);
    final theme = Theme.of(context);
    return Column(
      spacing: AppSpacing.sm,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "File",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.start,
        ),
        if (upload.uploadFile != null)
          SelectedFileCard(uploadState: upload)
        else
          UploadFilePlaceholder(
            onTap: onTap,
            isPickingImages: isPickingImages,
            isGeneratingPDF: isGeneratingPDF,
            
          ),
      ],
    );
  }
}
