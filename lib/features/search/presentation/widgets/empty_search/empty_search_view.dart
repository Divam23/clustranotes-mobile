import 'package:clustranotes_mobile/features/search/presentation/widgets/empty_search/recent_search/recent_search_section.dart';
import 'package:clustranotes_mobile/features/search/presentation/widgets/empty_search/recommended_for_you_section/recommended_for_you_section.dart';
import 'package:clustranotes_mobile/features/search/presentation/widgets/empty_search/trending_search_section/trending_search_section.dart';
import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';

class EmptySearchView extends StatelessWidget{
  const EmptySearchView({super.key});
  
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            RecentSearchSection(),
            const SizedBox(height: AppSpacing.sectionGap,),
            TrendingSearchSection(),
            const SizedBox(height: AppSpacing.sectionGap,),
            RecommendedForYouSection(),
          ],
        ),
      ),
    );
  }
  
}
