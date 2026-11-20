import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/utils/formatters/datetime_formatter.dart';
import 'package:clustranotes_mobile/core/utils/formatters/number_formatter.dart';
import 'package:clustranotes_mobile/core/widgets/dot.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/chip_item.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/filetype_chip.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/resource_chip.dart';
import 'package:clustranotes_mobile/core/widgets/thumbnail/note_thumbnail.dart';
import 'package:clustranotes_mobile/features/upload/domain/extensions/uploaded_note_domain.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_card.dart';
import 'package:clustranotes_mobile/features/upload/domain/extensions/note_relevant_timestamps.dart';
import 'package:clustranotes_mobile/features/upload/presentation/extension/note_owner_status_timeline_info.dart';
import 'package:clustranotes_mobile/features/upload/presentation/extension/note_owner_status_ui.dart';
import 'package:clustranotes_mobile/features/upload/presentation/extension/note_status_color_extension.dart';
import 'package:flutter/material.dart';

class UploadedNoteCardWidget extends StatelessWidget {
  final UploadedNoteCard note;
  const UploadedNoteCardWidget({required this.note, super.key});

  @override
  Widget build(BuildContext context) {

    final status = note.ownerStatus;
    final theme = Theme.of(context);
    final timestamp = note.statusTimestamp;
    final categoryChipConfig = note.category.chip;
    final fileTypeChipConfig =
        AppFileTypeChips.allFileTypes[note.noteContentType] ??
            AppFileTypeChips.pdf;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: AspectRatio(
              aspectRatio: 2/3,
              child: NoteThumbnail(
                contentType: note.noteContentType,
                thumbnailUrl: note.file.thumbnailUrl,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: theme.textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: AppSpacing.xs,
                    children: [
                      Text(
                        note.subject,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.colorScheme.onSecondary
                        ),
                      ),
                      Dot(radius: 4, color: theme.colorScheme.primary),
                      AppChip(item: categoryChipConfig)
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.sm,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: AppSpacing.md,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: AppSpacing.xs,
                        children: [
                          Icon(AppIcons.notVisible),
                          Text(NumberFormatter.compact(note.stats.viewsCount)),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: AppSpacing.xs,
                        children: [
                          Icon(AppIcons.download),
                          Text(NumberFormatter.compact(note.stats.downloadCount)),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: AppSpacing.xs,
                        children: [
                          Icon(AppIcons.like),
                          Text(NumberFormatter.compact(note.stats.likesCount)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.sm,),
                Text(
                  status.label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: status.color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm,),
                if(timestamp.timestamp != null)...[
                  Text(
                    '${status.timelineInfo} ${DateTimeFormatter.timeAgo(timestamp.timestamp!)}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSecondary,
                    ),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
