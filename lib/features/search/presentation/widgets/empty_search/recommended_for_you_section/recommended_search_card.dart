import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/button/bookmark_button.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/chip_item.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/resource_chip.dart';
import 'package:clustranotes_mobile/core/widgets/thumbnail/note_thumbnail.dart';
import 'package:clustranotes_mobile/features/notes/models/note_card_model.dart';
import 'package:flutter/material.dart';

class RecommendedSearchCard extends StatelessWidget {
  final NoteCardModel item;
  const RecommendedSearchCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final categoryChipConfig = item.category.chip;
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      borderRadius: AppRadius.card,
      child: Container(
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

                    child: NoteThumbnail(
                      contentType: item.contentType,
                      thumbnailUrl: item.thumbnailUrl,
                      borderRadius: AppRadius.card.copyWith(
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: AppSpacing.sm,
                  right: AppSpacing.sm,
                  child: AppBookmarkButton(onPressed: () {}),
                ),
                Positioned(
                  bottom: AppSpacing.sm,
                  left: AppSpacing.sm,
                  child: AppChip(item: categoryChipConfig),
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
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium
                  ),
                  Text(
                    item.subject,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onSecondary,
                    ),
                  ),
                  if (item.collegeName != null) ...[
                    Text(
                      item.collegeName!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                  if (item.university != null) ...[
                    Text(
                      item.university!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
