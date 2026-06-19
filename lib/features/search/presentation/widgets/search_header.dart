import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/app_back_button.dart';
import 'package:clustranotes_mobile/core/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class SearchHeader extends StatelessWidget{
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  const SearchHeader({
    required this.controller,
    required this.onChanged,
    required this.onSubmitted,
    super.key
  });

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
          ),
        ),
      ),
      child: Row(
        spacing: AppSpacing.xs,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBackButton(),
          Expanded(
            child: AppSearchBar(
              readOnly: false,
              autoFocus: true,
              controller: controller,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}
