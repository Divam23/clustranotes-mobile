import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_upload_status_enum.dart';
import 'package:flutter/material.dart';

class UploadProgressScreenHeader extends StatelessWidget {
  final NoteUploadStatus uploadStatus;
  const UploadProgressScreenHeader({required this.uploadStatus, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String _uploadDisplayText(){
      switch(uploadStatus){
        case NoteUploadStatus.idle:
          return "Preparing note to upload";

        case NoteUploadStatus.uploading:
          return "Please wait while we upload your note";
          
        case NoteUploadStatus.success:
          return "All Done!";
          
        case NoteUploadStatus.cancelled:
          return "Note upload cancelled";
          
        case NoteUploadStatus.failure:
          return "Something went wrong";
      }
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              AppIcons.uploadCloud,
              size: 30,
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(width: AppSpacing.sm),
            Flexible(
              child: Text(
                'Uploading Note',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: AppSpacing.xs),

        Text(
          _uploadDisplayText(),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
