import 'package:clustranotes_mobile/app/theme/app_icons.dart';
import 'package:clustranotes_mobile/app/theme/app_radius.dart';
import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class RecentSearchItem {
  final String query;

  const RecentSearchItem({
    required this.query,
  });
}

class SingleRecentSearch extends StatelessWidget {
  final RecentSearchItem item;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const SingleRecentSearch({
    super.key,
    required this.item,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.searchBar,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: theme.disabledColor.withValues(alpha: 0.1)
          ),
          borderRadius: AppRadius.card,
          color: theme.colorScheme.surfaceDim.withValues(alpha: 0.6)
        ),
        child: Row(
          spacing: AppSpacing.sm,
          children: [
            Icon(
              AppIcons.history,
              color: theme.disabledColor,
            ),

            Expanded(
              child: Text(
                item.query,
                style: theme.textTheme.bodyMedium,
              ),
            ),

            IconButton(
              onPressed: onDelete,
              icon: Icon(
                AppIcons.close,
                color: theme.disabledColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
