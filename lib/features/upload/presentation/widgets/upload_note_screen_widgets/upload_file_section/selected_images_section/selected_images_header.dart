import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/utils/formatters/formatter.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_state.dart';
import 'package:flutter/material.dart';

class SelectedImagesHeader extends StatelessWidget {
  final UploadState uploadState;
  const SelectedImagesHeader({required this.uploadState, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom:AppSpacing.sm),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      style: theme.textTheme.titleLarge,
                      "Selected Pages (${uploadState.selectedImages.length})",
                    ),
                    Text(
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.dividerColor.withValues(alpha: 0.5),
                      ),
                      "Drag to reorder pages",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: AppColors.primarySky.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          child: Text(
            style: theme.textTheme.labelMedium?.copyWith(
              color: AppColors.primarySky,
            ),
            NumberFormatter.labelWithCount(
              count: uploadState.selectedImages.length,
              singularLabel: "page",
              pluralLabel: "pages",
            ),
          ),
        ),
      ],
    );
  }
}
