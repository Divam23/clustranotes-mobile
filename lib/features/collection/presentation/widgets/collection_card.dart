import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/chip_item.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/resource_chip.dart';
import 'package:clustranotes_mobile/features/collection/models/collection_summary_model.dart';
import 'package:flutter/material.dart';

class CollectionCard extends StatelessWidget{
  final CollectionSummary collection;
  const CollectionCard({required this.collection, super.key});
  
  @override
  Widget build(BuildContext context){
    final categoryChipConfig =
        AppCategoryChips.allCategories[collection.type] ??
            AppCategoryChips.others;
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      borderRadius: AppRadius.card,
      child: Container(
        padding: const EdgeInsets.only(bottom: AppSpacing.xs),
        height: 120,
        width: 120,
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
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: theme.dividerColor.withValues(alpha: 0.3),
                      ),
                    ),
                  ),
                  
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
                      collection.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium
                  ),
                  Text(
                    collection.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelMedium?.copyWith(
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

