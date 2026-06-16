import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/search/presentation/widgets/result_search/filter_button.dart';
import 'package:flutter/material.dart';

class FilterSection extends StatelessWidget{
  const FilterSection({super.key});
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                color: theme.dividerColor.withValues(alpha: 0.3),
              )) 
      ),
      child: Row(
        children: [
          Expanded(child: FilterButton(showRightBorder: true, filterName: "Sort", icon: AppIcons.sort, onTap: () {}, isSelected: false,)),
          Expanded(child: FilterButton(showRightBorder: true, filterName: "Category", onTap: () {}, isSelected: false,)),
          Expanded(child: FilterButton(showRightBorder: true, filterName: "File Type", onTap: () {}, isSelected: false,)),
          Expanded(child: FilterButton(showRightBorder: false, filterName: "Filters", icon: AppIcons.filter, onTap: () {}, isSelected: false,)),
        ],
      ),
    );
  }
}
