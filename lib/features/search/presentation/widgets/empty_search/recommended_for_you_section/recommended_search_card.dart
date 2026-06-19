import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/bookmark_button.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/chip_item.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/filetype_chip.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/resource_chip.dart';
import 'package:flutter/material.dart';

class RecommendedSearchItem {
  final String title;
  final String thumbnail;
  final String semester;
  final String subject;
  final String collegeName;
  final String category;
  final String fileType;

  const RecommendedSearchItem({
    required this.title,
    required this.thumbnail,
    required this.semester,
    required this.subject,
    required this.collegeName,
    required this.category,
    required this.fileType,
  });
}

class RecommendedSearchCard extends StatelessWidget {
  final RecommendedSearchItem item;
  const RecommendedSearchCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final categoryChipConfig = AppCategoryChips.allCategories[item.category] ?? AppCategoryChips.others;
    final fileTypeChipConfig = AppFileTypeChips.allFileTypes[item.fileType] ?? AppFileTypeChips.pdf;
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
                      item.thumbnail,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
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
                  Text(item.title, style: theme.textTheme.titleMedium),
                  Text(
                    item.subject,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onSecondary,
                    ),
                  ),
                  Text(
                    item.collegeName,
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
