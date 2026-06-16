import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/search/data/suggestion_search_dummy_data.dart';
import 'package:clustranotes_mobile/features/search/presentation/widgets/suggestion_search/single_search_suggestion.dart';
import 'package:flutter/material.dart';

class SuggestionSearchView extends StatelessWidget{
  const SuggestionSearchView({super.key});
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(top: AppSpacing.sm, left: AppSpacing.sm),
            child: Text(
              "SUGGESTIONS",
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.onSecondary.withValues(alpha: 0.7)
              ),
            ),
          ),
          ...suggestionSearchItems.map(
              (item){
                return SingleSuggestionSearch(
                    item: item, 
                    onTap: (){}, 
                    onFillSearch: (){}
                );
              }
          )
        ],
      ),
    );
  }
}
