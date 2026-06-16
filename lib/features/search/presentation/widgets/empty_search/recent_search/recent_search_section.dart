
import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/search/data/recent_search_dummy_data.dart';
import 'package:clustranotes_mobile/features/search/presentation/widgets/empty_search/recent_search/single_recent_search.dart';
import 'package:flutter/material.dart';


class RecentSearchSection extends StatelessWidget{
  const RecentSearchSection({super.key});
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Text(
                  "Recent Searches",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                )
            ),
            TextButton(
              onPressed: () {},
              child: Text("Clear All"),
              
            ),
          ],
        ),
        Column(
          spacing: AppSpacing.xs,
          children: [
            ...recentSearches.map(
                    (search){
                  return SingleRecentSearch(item: search, onTap: () {  }, onDelete: () {  },);
                }
            )
          ],
        )
      ],
    );
  }
}
