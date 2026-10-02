import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';

class AppViews extends StatelessWidget {
  final int? count;
  final double? size;

  const AppViews({required this.count, this.size = 20, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: AppSpacing.xs,
      children: [
        Icon(
          AppIcons.views,
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
    );
  }
}
