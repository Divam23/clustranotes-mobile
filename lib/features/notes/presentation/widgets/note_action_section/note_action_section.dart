import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/button/multi_utility_button.dart';
import 'package:flutter/material.dart';

class NoteActionSection extends StatelessWidget {
  const NoteActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.md,
        horizontal: AppSpacing.screenPadding,
      ),
      child: Row(
        children: [
          Expanded(
            child: MultiUtilityButton(
              elevation: 1,
              onPressed: (){},
              text: "Open Note",
              borderRadius: AppRadius.searchBarSharp,
              buttonColor: theme.colorScheme.primary,
              buttonTextColor: theme.colorScheme.onPrimary,
              borderColor: Colors.transparent,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: MultiUtilityButton(
              text: "",
              borderRadius: AppRadius.searchBarSharp,
              borderColor: AppColors.transparent,
              buttonColor: theme.colorScheme.onInverseSurface,
              elevation: 1,
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    AppIcons.download,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    "Download",
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
