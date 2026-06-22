import 'package:clustranotes_mobile/app/theme/app_icons.dart';
import 'package:clustranotes_mobile/app/theme/app_radius.dart';
import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/core/widgets/button/app_button.dart';
import 'package:flutter/material.dart';

class RecentlyOpenedCard extends StatelessWidget {
  const RecentlyOpenedCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.md,
      children: [
        Text(
          "Recently Opened",
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(AppSpacing.cardPadding),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: AppRadius.card,
            border: Border.all(
              color: theme.disabledColor.withValues(alpha: 0.1)
            )
          ),
          child: Row(
            spacing: 20,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: AppRadius.button,
                  color: theme.colorScheme.primary.withValues(alpha: 0.2),
                ),
                child: Center(
                  child: Icon(AppIcons.note, color: theme.colorScheme.primary),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Text(
                      "DBMS Unit 3 Notes",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Last opened today", 
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSecondary
                      )
                    ),
                  ],
                ),
              ),
              AppButton(
                text: "Continue",
                variant: AppButtonVariant.filled,
                onPressed: (){}
              )
            ],
          ),
        ),
      ],
    );
  }
}
