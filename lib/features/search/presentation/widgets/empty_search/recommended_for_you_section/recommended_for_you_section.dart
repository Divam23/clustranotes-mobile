import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/notes/data/notecard_dummy_data.dart';
import 'package:clustranotes_mobile/features/search/presentation/widgets/empty_search/recommended_for_you_section/recommended_search_card.dart';
import 'package:flutter/material.dart';


class RecommendedForYouSection extends StatelessWidget {
  const RecommendedForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textScaler = MediaQuery.textScalerOf(context);
    final listHeight = textScaler.scale(240.0).clamp(240.0, 300.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.md,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Recommended for you", style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),),
            Text(
              "Based on your academic interests",
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSecondary,
              ),
            ),
          ],
        ),
        SizedBox(
          height: listHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: dummyNoteCards.length,
            separatorBuilder: (_, __)=> const SizedBox(width: AppSpacing.md,),
            itemBuilder: (context, index){
              return RecommendedSearchCard(item: dummyNoteCards[index]);
            },
          ),
        ),
      ],
    );
  }
}
