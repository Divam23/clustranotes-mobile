import 'package:clustranotes_mobile/app/theme/app_radius.dart';
import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/core/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';

class ContributionStatCardModel {
  final int stat;
  final String label;
  final Color color;
  final IconData? icon;

  const ContributionStatCardModel({
    required this.stat,
    required this.label,
    required this.color,
    this.icon,
  });
}

class ContributionStatsCard extends StatelessWidget {
  final ContributionStatCardModel card;
  const ContributionStatsCard({required this.card, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface.withValues(alpha: 0.7),
          borderRadius: AppRadius.button,
          border: Border.all(
            color: theme.disabledColor.withValues(alpha: 0.1),
            width: 0.2,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.sm,
        ),
        child: Column(
          spacing: AppSpacing.md,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                NumberFormatter.compact(card.stat),
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: card.color,
                ),
              ),
            ),
            Center(
              child: Text(
                card.label,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.hintColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
