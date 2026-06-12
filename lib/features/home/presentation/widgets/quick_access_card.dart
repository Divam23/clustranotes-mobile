import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter/material.dart';

class QuickAction {
  final String title;
  final IconData icon;

  const QuickAction({
    required this.title,
    required this.icon,
  });
}

class QuickAccessCards extends StatelessWidget{
  const QuickAccessCards({super.key});
  
  @override
  Widget build(BuildContext context){
    
    final theme = Theme.of(context);

    final quickActions = [
      QuickAction(
        title: "Notes",
        icon: AppIcons.textNote,
      ),
      QuickAction(
        title: "PYQs",
        icon: AppIcons.pyq,
      ),
      QuickAction(
        title: "Books",
        icon: AppIcons.book,
      ),
      QuickAction(
        title: "Assignments",
        icon: AppIcons.assignment,
      ),
      QuickAction(
        title: "Labs",
        icon: AppIcons.lab,
      ),
    ];
    
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.md,
      children: [
        Text(
          "Quick Access",
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: AppSpacing.sm,
            children: [
              ...quickActions.map(
                    (action) {
                  return InkWell(
                    onTap: () {},
                    borderRadius: AppRadius.chip,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                        vertical: AppSpacing.md,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: AppRadius.chip,
                        border: Border.all(
                          color: theme.disabledColor.withValues(alpha: 0.1)
                        )
                      ),
                      child: Row(
                        children: [
                          Icon(
                            action.icon,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Text(
                            action.title,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
