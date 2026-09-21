import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteDownloadToggleSection extends ConsumerWidget {
  const NoteDownloadToggleSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final upload = ref.watch(uploadProvider);
    final notifier = ref.read(uploadProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Download",
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          "Choose who can download this note.",
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(height: AppSpacing.md),

        Card(
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.card,
            side: BorderSide(
              color: theme.dividerColor.withValues(alpha: 0.1),
              width: 0.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary.withValues(
                                    alpha: 0.1,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  AppIcons.download,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                              const SizedBox(width: AppSpacing.md),
                              Text(
                                "Download Allowed?",
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.xs),

                          Text(
                            upload.canDownload ? 
                            "Anyone on ClustraNotes download this note."
                            : "No one can download this note",
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.hintColor,
                              height: 1.25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.scale(
                      scale: 0.9,
                      child: Switch(
                        value: upload.canDownload,
                        onChanged: notifier.updateCanDownload,
                        inactiveThumbColor: AppColors.primarySky,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
