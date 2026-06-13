import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class SearchHeader extends StatelessWidget{
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(
        top: AppSpacing.chipGap,
        left: 0,
        right: AppSpacing.lg,
        bottom: AppSpacing.itemGap
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor.withValues(
              alpha: 0.3,
            ),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        spacing: AppSpacing.xs,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(AppIcons.back),
            ),
          ),
          Expanded(
            child: AppSearchBar(
              readOnly: false,
              autoFocus: true,
            ),
          ),
        ],
      ),
    );
  }
}
