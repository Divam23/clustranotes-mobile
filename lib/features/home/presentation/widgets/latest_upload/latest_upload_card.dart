import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/utils/formatters/formatter.dart';
import 'package:clustranotes_mobile/core/widgets/button/bookmark_button.dart';
import 'package:clustranotes_mobile/core/widgets/dot.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/chip_item.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/filetype_chip.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/resource_chip.dart';
import 'package:clustranotes_mobile/core/widgets/thumbnail/note_thumbnail.dart';
import 'package:clustranotes_mobile/features/notes/models/note_card_model.dart';
import 'package:flutter/material.dart';

class LatestUploadCard extends StatelessWidget {
  final NoteCardModel card;
  const LatestUploadCard({required this.card, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final categoryChipConfig = card.category.chip;
    final fileTypeChipConfig =
        AppFileTypeChips.allFileTypes[card.contentType] ?? AppFileTypeChips.pdf;
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: AppRadius.card,
          border: Border.all(color: theme.disabledColor.withValues(alpha: 0.1)),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: AppRadius.image,
                    child: NoteThumbnail(
                      contentType: card.contentType,
                      thumbnailUrl: card.thumbnailUrl,
                    ),
                  ),
                ),
                Positioned(
                  bottom: AppSpacing.lg,
                  right: AppSpacing.lg,
                  child: AppBookmarkButton(onPressed: () {}),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xxs),
            Row(
              spacing: AppSpacing.md,
              children: [
                Column(
                  spacing: AppSpacing.xxs,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      card.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleLarge,
                    ),
                    Row(
                      spacing: AppSpacing.xs,
                      children: [
                        if (card.semester != null) ...[
                          Text(
                            "Sem ${card.semester!}",
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.onSecondary,
                            ),
                          ),
                          Dot(radius: 4, color: theme.colorScheme.primary),
                        ],
                        Text(
                          card.subject,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.colorScheme.onSecondary,
                          ),
                        ),
                        
                      ],
                    ),
                    if (card.collegeName != null) ...[
                      Text(
                        card.collegeName!,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.onSecondary,
                        ),
                      ),
                    ],
                    const SizedBox(height: AppSpacing.sm),
                    Wrap(
                      spacing: AppSpacing.md,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Row(
                          spacing: AppSpacing.md,
                          children: [
                            Row(
                              spacing: AppSpacing.xs,
                              children: [
                                Icon(
                                  AppIcons.download,
                                  color: theme.colorScheme.onSecondary,
                                  size: 25,
                                ),
                                Text(
                                  NumberFormatter.compact(card.downloadCount),
                                  style: theme.textTheme.labelMedium
                                      ?.copyWith(
                                        color: theme.colorScheme.onSecondary,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              spacing: AppSpacing.xs,
                              children: [
                                Icon(
                                  AppIcons.clock,
                                  color: theme.colorScheme.onSecondary,
                                  size: 25,
                                ),
                                Text(
                                  DateTimeFormatter.timeAgo(card.publishedAt),
                                  style: theme.textTheme.labelMedium
                                      ?.copyWith(
                                        color: theme.colorScheme.onSecondary,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      spacing: AppSpacing.sm,
                      children: [
                        AppChip(item: categoryChipConfig),
                        AppChip(item: fileTypeChipConfig),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
