import 'package:clustranotes_mobile/core/api/models/note_content_type_enum.dart';
import 'package:clustranotes_mobile/core/utils/formatters/formatter.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_upload_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_provider.dart';
import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadNoteCard extends ConsumerWidget {
  const UploadNoteCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final upload = ref.watch(uploadProvider);
    final status = upload.noteUploadStatus;

    final clampedProgress = status == NoteUploadStatus.success
        ? 1.0
        : upload.uploadProgress.clamp(0.0, 1.0);

    // Dynamic accent color for each of the 4 visual states
    final Color stateColor = switch (status) {
      NoteUploadStatus.uploading => theme.colorScheme.primary,
      NoteUploadStatus.success => const Color(0xFF1CB055),
      NoteUploadStatus.failure => const Color(0xFFEA4335),
      NoteUploadStatus.cancelled => const Color(0xFF6B7280),
      NoteUploadStatus.idle => theme.colorScheme.primary,
    };

    // File type icon resolver
    final String fileIcon = switch (upload.uploadFile?.contentType) {
      NoteContentType.pdf => AppIcons.pdfIcon,
      NoteContentType.ppt || NoteContentType.pptx => AppIcons.pptIcon,
      NoteContentType.doc || NoteContentType.docx => AppIcons.docIcon,
      _ => AppIcons.fileIcon,
    };

    final sentFormatted = FileSizeFormatter.format(upload.bytesSent);
    final totalFormatted = FileSizeFormatter.format(upload.totalBytes);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: AppRadius.card,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // File Details Header
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                padding: const EdgeInsets.all(AppSpacing.xs),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(
                    alpha: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Image.asset(fileIcon, fit: BoxFit.contain),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      upload.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      upload.uploadFile != null
                          ? FileSizeFormatter.format(upload.uploadFile!.sizeInBytes)
                          : totalFormatted,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
            child: Divider(
              height: 1,
              thickness: 1,
              color: theme.colorScheme.outlineVariant.withValues(alpha: 0.25),
            ),
          ),

          // Upload Progress Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    status == NoteUploadStatus.success
                        ? '$totalFormatted / $totalFormatted'
                        : '$sentFormatted / $totalFormatted',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    '${(clampedProgress * 100).round()}%',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: stateColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                tween: Tween<double>(begin: 0.0, end: clampedProgress),
                builder: (context, animatedValue, _) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.full),
                    child: LinearProgressIndicator(
                      value: animatedValue,
                      minHeight: 8,
                      backgroundColor: theme.colorScheme.surfaceContainerHighest,
                      valueColor: AlwaysStoppedAnimation<Color>(stateColor),
                    ),
                  );
                },
              ),
              // Show estimated time only when upload is actively in progress
              if (status == NoteUploadStatus.uploading) ...[
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    Icon(
                      AppIcons.pending,
                      size: 14,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      "Estimated time remaining: 28 seconds",
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
