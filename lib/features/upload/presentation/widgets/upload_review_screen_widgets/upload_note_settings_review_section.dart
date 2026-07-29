import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_review_screen_widgets/review_section_header.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadNoteSettingsReviewSection extends ConsumerWidget {
  const UploadNoteSettingsReviewSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final upload = ref.watch(uploadProvider);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.sm,
      ),
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
        ],
      ),
      child: Column(
        spacing: AppSpacing.itemGap,
        children: [
          ReviewSectionHeader(
            icon: AppIcons.settings,
            sectionNumber: 3,
            sectionTitle: "Upload Settings",
          ),
          Container(
            child: Row(
              spacing: AppSpacing.md,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  AppIcons.language,
                  color: AppColors.primarySky,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: AppSpacing.md,
                        children: [
                          Text(
                            "Visibility",
                            style: theme.textTheme.titleMedium,
                          ),
                          upload.isPublic == true
                              ? Text(
                                  "Public",
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: AppColors.success,
                                  ),
                                )
                              : Text(
                                  "Private",
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: AppColors.warning,
                                  ),
                                ),
                        ],
                      ),
                      if (upload.isPublic == true)
                        Text(
                          "Anyone can view and download the material",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.dividerColor.withValues(alpha: 0.5)
                          ),
                        )
                      else
                        Text(
                          "Nobody can view and download the material",
                          style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.dividerColor.withValues(alpha: 0.5)
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
