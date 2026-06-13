import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/search/presentation/widgets/recent_search_section.dart';
import 'package:clustranotes_mobile/features/search/presentation/widgets/search_header.dart';
import 'package:flutter/material.dart';

enum SearchState {
  empty,
  suggestion,
  result,
}

class SearchScreen extends StatelessWidget{
  const SearchScreen({super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchHeader(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        RecentSearchSection(),
                      ],
                    ),
                  ),
                )
              )
            ],
          )
        
      ),
    );
  }
}
