import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter/material.dart';

class MultiUtilityButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final String text;
  final BorderRadius? borderRadius;
  final Border? border;
  final Color? borderColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  const MultiUtilityButton({
    this.child,
    required this.onPressed,
    required this.text,
    this.buttonColor,
    this.buttonTextColor,
    this.borderRadius,
    this.border,
    this.borderColor,
    this.fontWeight,
    this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FilledButton.tonal(
      
      style: FilledButton.styleFrom(
        elevation: 0,
        overlayColor: Colors.transparent,
        backgroundColor: buttonColor ?? AppColors.primarySky.withValues(alpha: 0.2),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(AppRadius.full),
        ),
        side: BorderSide(
          color: borderColor ?? theme.colorScheme.primaryFixedDim,
          width: 1.0,
        ),
      ),
      onPressed: onPressed,
      child: child ?? Text(
        text,
        style: theme.textTheme.labelLarge?.copyWith(
          color: buttonTextColor ?? theme.colorScheme.primary,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
