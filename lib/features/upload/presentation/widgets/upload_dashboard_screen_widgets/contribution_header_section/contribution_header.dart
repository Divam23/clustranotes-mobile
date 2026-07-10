import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class ContributionHeader extends StatelessWidget{
  const ContributionHeader({super.key});

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Column(
      spacing: AppSpacing.xs,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
            "Contributions",
            style: theme.textTheme.displayLarge?.copyWith(

            )
        ),
        Text(
          "Manage your uploads and review status",
          style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSecondary
          ),
        )
      ],
    );
  }
}
