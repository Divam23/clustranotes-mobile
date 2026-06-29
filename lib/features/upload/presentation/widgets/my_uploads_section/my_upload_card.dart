import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/utils/formatters/datetime_formatter.dart';
import 'package:clustranotes_mobile/core/widgets/thumbnail/uploaded_note_summary_thumbnail.dart';
import 'package:clustranotes_mobile/features/upload/domain/extensions/note_relevant_timestamps.dart';
import 'package:clustranotes_mobile/features/upload/domain/extensions/upload_note_summary_domain.dart';
import 'package:clustranotes_mobile/features/upload/models/uploaded_note_summary_model.dart';
import 'package:clustranotes_mobile/features/upload/presentation/extension/note_owner_status_timeline_info.dart';
import 'package:clustranotes_mobile/features/upload/presentation/extension/note_owner_status_ui.dart';
import 'package:clustranotes_mobile/features/upload/presentation/extension/note_status_color_extension.dart';
import 'package:flutter/material.dart';

class MyUploadCard extends StatelessWidget {
  final UploadedNoteSummary uploadedNote;
  const MyUploadCard({required this.uploadedNote, super.key});

  @override
  Widget build(BuildContext context) {
    final status = uploadedNote.ownerStatus;
    final theme = Theme.of(context);
    final timestamp = uploadedNote.statusTimestamp;
    return InkWell(
      splashColor: Colors.transparent,
      borderRadius: AppRadius.card,
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.sm,
          horizontal: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface.withValues(alpha: 0.7),
          borderRadius: AppRadius.card,
          border: Border.all(
            color: theme.dividerColor.withValues(alpha: 0.1),
            width: 0.4,
          ),
        ),
        child: Row(
          spacing: AppSpacing.lg,
          children: [
            uploadedNote.noteContentType != null
                ? UploadedNoteSummaryThumbnail(
                    noteContentType: uploadedNote.noteContentType!,
                  )
                : Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: AppRadius.button,
                      color: theme.colorScheme.primary.withValues(alpha: 0.2),
                    ),
                    child: Center(
                      child: Icon(
                        AppIcons.note,
                        color: theme.colorScheme.primary,
                        size: 30,
                      ),
                    ),
                  ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Text(
                    uploadedNote.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    status.label,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: status.color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${status.timelineInfo} ${DateTimeFormatter.timeAgo(timestamp.timestamp)}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
