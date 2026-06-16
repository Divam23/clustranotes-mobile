import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';

class TrendingSearchItem{
  final String searchQuery;
  const TrendingSearchItem({
    required this.searchQuery  
  });
}

class SingleTrendingSearch extends StatelessWidget{
  final TrendingSearchItem item;
  final VoidCallback onTap;
  final VoidCallback onFillSearch;
  const SingleTrendingSearch({
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
      borderRadius: AppRadius.searchBar,
      child: Row(
        spacing: AppSpacing.sm,
        children: [
          Icon(
            AppIcons.trending,
            color: theme.disabledColor,
          ),
      
          Expanded(
            child: Text(
              item.searchQuery,
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
    );
  }
}
