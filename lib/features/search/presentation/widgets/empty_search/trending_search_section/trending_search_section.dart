import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/search/data/trending_search_dummy_data.dart';
import 'package:clustranotes_mobile/features/search/presentation/widgets/empty_search/trending_search_section/single_trending_search.dart';
import 'package:flutter/material.dart';


class TrendingSearchSection extends StatelessWidget {
  const TrendingSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.md
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: theme.dividerColor.withValues(
              alpha: 0.3,
            ),
            width: 0.5,
          ),
          bottom: BorderSide(
            color: theme.dividerColor.withValues(
              alpha: 0.3,
            ),
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Trending Searches",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              //TextButton(onPressed: () {}, child: Text("Show more")),
            ],
          ),
          Column(
            spacing: AppSpacing.xs,
            children: [
              ...trendingSearches.map((item) {
                return SingleTrendingSearch(
                  item: item,
                  onTap: () {},
                  onFillSearch: () {},
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
