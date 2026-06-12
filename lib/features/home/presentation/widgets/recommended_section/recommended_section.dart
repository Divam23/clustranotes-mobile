import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/home/data/dummy_recommended_data.dart';
import 'package:clustranotes_mobile/features/home/presentation/widgets/recommended_section/recommended_card.dart';
import 'package:flutter/material.dart';



class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: AppSpacing.itemGap,
            children: [
              ...recommendedItems.map((item) {
                return RecommendedCard(item: item);
              }),
            ],
          ),
        ),
      ],
    );
  }
}
