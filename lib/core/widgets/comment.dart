import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter/material.dart';

class AppComment extends StatelessWidget {
  final VoidCallback onTap;
  final int? count;

  const AppComment({
    required this.onTap,
    this.count,
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
            color: theme.colorScheme.onSecondary,
          ),
          if (count != null) ...[
            Text('$count'),
          ],
        ],
      ),
    );
  }
}
