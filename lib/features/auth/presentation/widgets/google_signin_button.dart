import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/button/multi_utility_button.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget{
  final VoidCallback onPressed;
  final bool isLoading;
  const GoogleSignInButton({
    required this.isLoading,
    required this.onPressed,
    super.key
  });
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return MultiUtilityButton(
      borderRadius: AppRadius.chip,
      buttonColor: theme.colorScheme.surface,
      borderColor: theme.disabledColor.withValues(alpha: 0.1),
      elevation: 1,
      onPressed: isLoading ? null : onPressed,
      text: "",
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.md
        ),
        child: isLoading ? Row(
          spacing: AppSpacing.md,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: theme.colorScheme.onPrimary,
              ),
            ),
            Text(
              "Signing In",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ) : Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://developers.google.com/identity/images/g-logo.png",
              width: 22,
              height: 22,
            ),
            const SizedBox(width: AppSpacing.md),
            Flexible(
              child: Text(
                "Continue with Google",
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
