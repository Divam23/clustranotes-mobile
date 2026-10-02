import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';

class AppComment extends StatelessWidget {
  final VoidCallback onTap;
  final int? count;
  final double? size;

  const AppComment({
    required this.onTap,
    this.count,
    this.size = 20,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        spacing: AppSpacing.xs,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            AppIcons.comment,
            color: theme.colorScheme.onSurfaceVariant,
            size: size,
          ),
          if (count != null)
            Text(
              NumberFormatter.compact(count!),
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
        ],
      ),
    );
  }
}
