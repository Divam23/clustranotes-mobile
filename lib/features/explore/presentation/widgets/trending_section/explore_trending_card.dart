import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/utils/formatters/formatter.dart';
import 'package:clustranotes_mobile/core/widgets/button/bookmark_button.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/chip_item.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/filetype_chip.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/resource_chip.dart';
import 'package:clustranotes_mobile/core/widgets/thumbnail/note_thumbnail.dart';
import 'package:clustranotes_mobile/features/notes/models/note_card_model.dart';
import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  final NoteCardModel card;
  const TrendingCard({required this.card, super.key});

  @override
  Widget build(BuildContext context) {
    final categoryChipConfig =
        AppCategoryChips.allCategories[card.category] ??
        AppCategoryChips.others;
    final fileTypeChipConfig = AppFileTypeChips.allFileTypes[card.contentType] ?? AppFileTypeChips.pdf;
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      borderRadius: AppRadius.card,
      child: Container(
        padding: const EdgeInsets.only(bottom: AppSpacing.xs),
        height: 230,
        width: 230,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: AppRadius.card,
          border: Border.all(color: theme.disabledColor.withValues(alpha: 0.1)),
        ),
        child: Column(
          spacing: AppSpacing.xs,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              children: [
                Container(
                  height: 135,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: theme.dividerColor.withValues(alpha: 0.3),
                      ),
                    ),
                  ),
                  child: NoteThumbnail(
                    contentType: card.contentType,
                    thumbnailUrl: card.thumbnailUrl,
                    borderRadius: AppRadius.card.copyWith(
                      bottomRight: Radius.zero,
                      bottomLeft: Radius.zero,
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
                    card.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium
                  ),
                  Text(
                    card.subject,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onSecondary,
                    ),
                  ),
                  if(card.collegeName != null) ...[
                    Text(
                      card.collegeName!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    )
                  ],
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          spacing: AppSpacing.xs,
                          children: [
                            Icon(
                              AppIcons.download,
                              size: 18,
                            ),
                            Text(
                              NumberFormatter.compact(card.downloadCount),
                              style: theme.textTheme.labelMedium,
                            )
                          ],
                        ),
                      ),
                      AppChip(item: fileTypeChipConfig)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
