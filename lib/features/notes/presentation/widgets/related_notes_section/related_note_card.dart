import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/dot.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/chip_item.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/resource_chip.dart';
import 'package:clustranotes_mobile/features/notes/models/note_model.dart';
import 'package:flutter/material.dart';


class RelatedNoteCard extends StatelessWidget{
  final Note note;
  const RelatedNoteCard({
    required this.note,
    super.key
  });
  
  @override
  Widget build(BuildContext context){
    final categoryChipConfig = AppCategoryChips.allCategories[note.category] ?? AppCategoryChips.others;
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      borderRadius: AppRadius.card,
      child: Container(
        height: 200,
        width: 200,
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
                  child: ClipRRect(
                    borderRadius: AppRadius.card.copyWith(
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero,
                    ),

                    child: Image.network(
                      note.file.thumbnailUrl!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
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
                    note.title, 
                    style: theme.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    spacing: AppSpacing.xs,
                    children: [
                      Text(
                        'Sem ${note.semester}',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.onSecondary,
                        ),
                      ),
                      Dot(radius: AppRadius.xxs, color: theme.colorScheme.primary),
                      Text(
                        note.subject,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.onSecondary,
                        ),
                      ),
                    ],
                  ),
                  
                  Text(
                    note.university!,
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
