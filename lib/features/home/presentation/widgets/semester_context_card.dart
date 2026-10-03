import 'package:clustranotes_mobile/core/widgets/button/multi_utility_button.dart';
import 'package:clustranotes_mobile/core/widgets/dot.dart';
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
            AppIcons.university,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(width: AppSpacing.sm),

          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "B.Tech CSE",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w700
                  ),
                ),

                const SizedBox(width: AppSpacing.xs),
                Dot(color: theme.colorScheme.surfaceTint,radius: AppRadius.xs,),
                const SizedBox(width: AppSpacing.xs),
                Flexible(
                  child: Text(
                    "Sem 5",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ],
            ),
          ),
          MultiUtilityButton(
            text: "Change",
            borderColor: AppColors.transparent,
            buttonColor: AppColors.transparent,
            onPressed: (){
              print("Semester change");
            },
          )
        ],
      ),
    );
  }
}
