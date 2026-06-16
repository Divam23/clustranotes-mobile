import 'package:flutter/material.dart';

class NavigationTab extends StatelessWidget{
  
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  
  const NavigationTab({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: isSelected ? 30 : 25,
            color: isSelected
                ? theme.colorScheme.primary
                : theme.colorScheme.onSurface,
          ),

          const SizedBox(height: 2),

          Text(
            label,
            style: isSelected ? theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.primary,
            ) : theme.textTheme.labelSmall?.copyWith(
              color: theme.unselectedWidgetColor,
            ),
          ),
        ],
      ),
    );
  }
  
}
