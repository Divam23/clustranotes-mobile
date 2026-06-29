import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/dot.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/chip_item.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/resource_chip.dart';
import 'package:clustranotes_mobile/core/widgets/thumbnail/note_thumbnail.dart';
import 'package:clustranotes_mobile/features/notes/models/note_details.dart';
import 'package:flutter/material.dart';


class RelatedNoteCard extends StatelessWidget{
  final NoteDetails note;
  const RelatedNoteCard({
    required this.note,
    super.key
  });
  
  @override
  Widget build(BuildContext context){
    final categoryChipConfig = AppCategoryChips.allCategories[note.note.category] ?? AppCategoryChips.others;
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      borderRadius: AppRadius.card,
      child: Container(
        height: 230,
        width: 230,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: AppRadius.card,
          border: Border.all(color: theme.disabledColor.withValues(alpha: 0.1)),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: theme.dividerColor.withValues(alpha: 0.3),

                      ),
                    ),
                  ),
                  child: NoteThumbnail(contentType: note.note.contentType, thumbnailUrl: note.note.file.thumbnailUrl, borderRadius: AppRadius.card?.copyWith(
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero
                  ),) 
                ),
                Positioned(
                    bottom: AppSpacing.sm,
                    left: AppSpacing.sm,
                    child: AppChip(item: categoryChipConfig)
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.xs,
                horizontal: AppSpacing.sm,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 0,
                children: [
                  Text(
                    note.note.title, 
                    style: theme.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    spacing: AppSpacing.xs,
                    children: [
                      Text(
                        'Sem ${note.note.semester}',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.onSecondary,
                        ),
                      ),
                      Dot(radius: AppRadius.xxs, color: theme.colorScheme.primary),
                      Text(
                        note.note.subject,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.onSecondary,
                        ),
                      ),
                    ],
                  ),
                  
                  Text(
                    note.note.collegeName!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.disabledColor,
                    ),
                  ),
                  Text(
                    note.note.university!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.primary,
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
