import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter/material.dart';

class AppChipItem {
  final String chipName;
  final BorderRadius radius;
  final Color color;

  const AppChipItem({
    required this.chipName,
    required this.radius,
    required this.color,
  });
}

class AppChip extends StatelessWidget {
  final AppChipItem item;
  const AppChip({
    super.key,
    required this.item, 
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical:AppSpacing.xxs,horizontal:AppSpacing.xs),
      height: 20,
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: item.radius,
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          item.chipName,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }
}
