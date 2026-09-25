import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_upload_status_enum.dart';
import 'package:flutter/material.dart';

class UploadProgressScreenHeader extends StatelessWidget {
  final NoteUploadStatus uploadStatus;
  const UploadProgressScreenHeader({required this.uploadStatus, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final (title, subtitle, titleColor) = switch (uploadStatus) {
      NoteUploadStatus.uploading => (
      'Uploading your note...',
      'Please keep ClustraNotes open until the upload is complete.',
      theme.colorScheme.onSurface,
      ),
      NoteUploadStatus.success => (
      'Note uploaded successfully!',
      'You can view your note in the uploads.',
      AppColors.success,
      ),
      NoteUploadStatus.failure => (
      "We couldn't upload your note.",
      'There was a problem while uploading the file.\nPlease try again.',
      AppColors.error,
      ),
      NoteUploadStatus.cancelled => (
      'Upload cancelled',
      'The upload was cancelled by you.',
      theme.colorScheme.onSurface,
      ),
      NoteUploadStatus.idle => ('', '', theme.colorScheme.onSurface),
    };
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: titleColor,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: AppSpacing.xs),

        Text(
          subtitle,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
