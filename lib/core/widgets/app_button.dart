import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:flutter/material.dart';

enum AppButtonVariant { filled, outlined }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final AppButtonVariant variant;

  const AppButton({
    super.key,
    this.icon,
    required this.text,
    required this.onPressed,
    this.variant = AppButtonVariant.filled,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isOutlined = variant == AppButtonVariant.outlined;

    final contentColor = isOutlined
        ? theme.colorScheme.primary
        : theme.colorScheme.onSecondary;

    final buttonContent = Row(
      spacing: AppSpacing.xxs,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null)
          Icon(
            icon,
            weight: 700,
            color: contentColor,
          ),
        Text(
          text,
          style: theme.textTheme.titleLarge?.copyWith(
            color: contentColor,
          ),
        )
      ],
    );

    if (isOutlined) {
      return OutlinedButton(
        onPressed: onPressed,
        
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: theme.colorScheme.primary,
            width: 2,
          ),
          enabledMouseCursor: MouseCursor.defer,
        ),
        child: buttonContent,
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle(),
      child: buttonContent,
    );
  }
}

