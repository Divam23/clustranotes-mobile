import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_owner_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/presentation/extension/upload_filter_extension.dart';
import 'package:flutter/material.dart';

class NoteStatusFilterChip extends StatelessWidget {
  final NoteOwnerStatus filter;
  final int count;
  final VoidCallback? onTap;
  final bool isSelected;
  const NoteStatusFilterChip({
    required this.filter,
    this.count = 0,
    this.onTap,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.searchBarRounded,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary : theme.colorScheme.surface,
          borderRadius: AppRadius.searchBarRounded,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.sm
        ),
        child: Row(
          spacing: AppSpacing.md,
          children: [
            Row(
              spacing: AppSpacing.sm,
              children: [
                if(filter.indicatorColor != null)
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: filter.indicatorColor,
                        shape: BoxShape.circle
                    ),
                  ),
                Text(
                  filter.label, 
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: isSelected ? theme.colorScheme.onPrimary : null
                  )
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: AppRadius.chip,
                color: AppColors.infoBackground,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xs,
              ),
              child: Text(
                "$count",
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.info,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
