import 'package:clustranotes_mobile/features/explore/presentation/widegts/trending_section/explore_trending_card.dart';
import 'package:clustranotes_mobile/features/notes/models/note_card_model.dart';
import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/app_spacing.dart';

class TrendingSection extends StatelessWidget {
  final List<NoteCardModel> notes;
  const TrendingSection({required this.notes, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: AppSpacing.itemGap,
      children: [
        Column(
          spacing: AppSpacing.xs,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Trending in BIT Mesra",
              style: theme.textTheme.headlineLarge?.copyWith(),
            ),
            Text(
              "Most downloaded this week",
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSecondary,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 230,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: notes.length,
            separatorBuilder: (_, __) =>
            const SizedBox(width: AppSpacing.md),
            itemBuilder: (context, index) {
              return TrendingCard(
                card: notes[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
