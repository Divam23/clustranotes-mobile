import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';

class SemesterContextCard extends StatelessWidget {
  const SemesterContextCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs, horizontal: AppSpacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.15),
        borderRadius: AppRadius.card,
      ),
      child: Row(
        children: [
          Icon(
            AppIcons.scholar,
            color: theme.colorScheme.primary,
          ),

          const SizedBox(width: AppSpacing.sm),

          Expanded(
            child: Row(
              children: [
                Text(
                  "B.Tech CSE",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w700
                  ),
                ),

                const SizedBox(width: AppSpacing.xs),

                Container(
                  height: 4,
                  width: 4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.colorScheme.primary,
                  ),
                ),

                const SizedBox(width: AppSpacing.xs),

                Text(
                  "Semester 5",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
          ),

          TextButton(
              onPressed: () {}, 
              child: Text(
                "Change",
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600
                ),
              )),
        ],
      ),
    );
  }
}
