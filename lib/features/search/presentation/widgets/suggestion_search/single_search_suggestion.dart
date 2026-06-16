import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';

class SuggestionSearchItem{
  final String searchSuggestion;
  const SuggestionSearchItem({
    required this.searchSuggestion
  });
}

class SingleSuggestionSearch extends StatelessWidget{
  final SuggestionSearchItem item;
  final VoidCallback onTap;
  final VoidCallback onFillSearch;
  const SingleSuggestionSearch({
    required this.item,
    required this.onTap,
    required this.onFillSearch,
    super.key
  });

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.searchBarSharp,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.xxs
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: theme.dividerColor.withValues(
                alpha: 0.2,
              ),
              width: 0.5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          child: Row(
            spacing: AppSpacing.sm,
            children: [
              Icon(
                AppIcons.search,
                color: theme.disabledColor,
              ),
          
              Expanded(
                child: Text(
                  item.searchSuggestion,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
          
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: onFillSearch,
                icon: Icon(
                  AppIcons.putUp,
                  color: theme.disabledColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
