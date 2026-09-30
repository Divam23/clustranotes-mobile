import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/home/presentation/widgets/recommended_section/recommended_card.dart';
import 'package:clustranotes_mobile/features/notes/data/notecard_dummy_data.dart';
import 'package:flutter/material.dart';



class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textScaler = MediaQuery.textScalerOf(context);
    final listHeight = textScaler.scale(320.0).clamp(320.0, 430.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
                child: Text(
                  "Recommended Section",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                )
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [Text("See All"), Icon(AppIcons.rightArrow)],
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
            separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
            itemBuilder: (context, index) {
              return RecommendedCard(card: dummyNoteCards[index]);
            },
          ),
        )
      ],
    );
  }
}
