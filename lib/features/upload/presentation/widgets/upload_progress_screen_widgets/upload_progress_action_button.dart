import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/button/multi_utility_button.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_upload_status_enum.dart';
import 'package:flutter/material.dart';

class UploadProgressActionButton extends StatelessWidget {
  final NoteUploadStatus uploadStatus;
  final VoidCallback? onCancel;
  final VoidCallback? onRetry;
  final VoidCallback? onViewNote;
  final VoidCallback? onDone;

  const UploadProgressActionButton({
    required this.uploadStatus,
    this.onCancel,
    this.onRetry,
    this.onViewNote,
    this.onDone,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 1. Uploading State: Single Cancel Outlined Button
    if (uploadStatus == NoteUploadStatus.uploading) {
      const errorColor = Color(0xFFEA4335);

      return MultiUtilityButton(
        elevation: 0,
        text: "",
        buttonColor: theme.colorScheme.surface,
        borderColor: const Color(0xFFFFD8D6),
        borderRadius: AppRadius.searchBarRounded,
        onPressed: onCancel ?? () {},
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.md,
            horizontal: AppSpacing.lg,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSpacing.sm,
            children: [
              Icon(AppIcons.close, size: 18, color: errorColor),
              Text(
                "Cancel Upload",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: errorColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final (primaryText, primaryIcon, primaryAction, secondaryText, secondaryAction) =
    switch (uploadStatus) {
      NoteUploadStatus.success => (
      "View Note",
      AppIcons.views,
      onViewNote,
      "Done",
      onDone,
      ),
      NoteUploadStatus.failure => (
      "Retry Upload",
      Icons.refresh_rounded,
      onRetry,
      "Cancel",
      onDone,
      ),
      NoteUploadStatus.cancelled => (
      "Try Again",
      Icons.file_upload_outlined,
      onRetry,
      "Go Back",
      onDone,
      ),
      _ => ("", Icons.circle, null, "", null),
    };

    if (uploadStatus == NoteUploadStatus.idle) {
      return const SizedBox.shrink();
    }

    return Column(
      spacing: AppSpacing.sm,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Primary Filled Button
        MultiUtilityButton(
          elevation: 1,
          text: "",
          buttonColor: theme.colorScheme.primary,
          borderColor: AppColors.transparent,
          borderRadius: AppRadius.searchBarRounded,
          onPressed: primaryAction ?? () {},
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.md,
              horizontal: AppSpacing.lg,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: AppSpacing.sm,
              children: [
                Icon(
                  primaryIcon,
                  size: 18,
                  color: theme.colorScheme.onPrimary,
                ),
                Text(
                  primaryText,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Secondary Outlined Button
        MultiUtilityButton(
          elevation: 0,
          text: "",
          buttonColor: theme.colorScheme.surface,
          borderColor: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
          borderRadius: AppRadius.searchBarRounded,
          onPressed: secondaryAction ?? () {},
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.md,
              horizontal: AppSpacing.lg,
            ),
            child: Center(
              child: Text(
                secondaryText,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
