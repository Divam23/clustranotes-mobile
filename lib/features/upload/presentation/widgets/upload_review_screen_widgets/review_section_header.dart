import 'package:clustranotes_mobile/app/theme/app_colors.dart';
import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class ReviewSectionHeader extends StatelessWidget {
  final IconData icon;
  final int sectionNumber;
  final String sectionTitle;
  const ReviewSectionHeader({
    required this.icon,
    required this.sectionNumber,
    required this.sectionTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.primarySky,
          size: 23,
          fontWeight: FontWeight(600),
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          "$sectionNumber. $sectionTitle",
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}
