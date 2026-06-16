import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget{
  final bool showRightBorder;
  final String filterName;
  final IconData? icon;
  final VoidCallback onTap;
  final bool isSelected;
  const FilterButton({
    required this.showRightBorder,
    required this.filterName,
    this.icon,
    required this.onTap,
    required this.isSelected,
    super.key
  });
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: showRightBorder ? Border(
          right: BorderSide(
            color: theme.dividerColor.withValues(alpha: 0.3),
          )) : null
      ),
      constraints: const BoxConstraints(
        minHeight: 40,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.xs,
            vertical: AppSpacing.xxs
        ),
        child: GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSpacing.xs,
            children: [
              if (icon != null)
                Icon(icon, color: theme.colorScheme.onSecondary),
              Text(
                filterName,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSecondary,
                  fontWeight: FontWeight.w700
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
