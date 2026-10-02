import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/button/multi_utility_button.dart';
import 'package:flutter/material.dart';

class EmailSignInButton extends StatelessWidget{
  final VoidCallback onPressed;
  const EmailSignInButton({required this.onPressed,super.key});
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return MultiUtilityButton(
      text: "",
      borderRadius: AppRadius.chip,
      buttonColor: theme.colorScheme.primary.withValues(alpha: 0.9),
      borderColor: AppColors.transparent,
      elevation: 1,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.md,
            horizontal: AppSpacing.md
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              AppIcons.email,
              size: 22,
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(width: AppSpacing.md),
            Flexible(
              child: Text(
                "Continue with Email",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
