import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter/material.dart';

class AcademicHeader extends StatelessWidget{
  const AcademicHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Evening, Divam 👋🏼",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSecondary
                ),
                
              ),
              const Text(
                "Clustra Notes",
                style: AppTextStyles.heading1,
              ),
            ],
          ),
        ),
        Container(
          height: 41,
          width: 41,
          decoration: BoxDecoration(
            borderRadius: AppRadius.button,
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.3),
          )
          ),          
          child: Stack(
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: AppRadius.button,
                  onTap: () {},
                  child: const SizedBox(
                    child: Center(
                      child: Icon(
                        AppIcons.notifications,
                        
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 9,
                right: 8,
                child: Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.full),
                    color: AppColors.notificationBadge
                  ),
                ),
              )
            ]
          ),
        ),
      ],
    );
  }
}
