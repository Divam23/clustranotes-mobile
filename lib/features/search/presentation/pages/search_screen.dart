
import 'package:clustranotes_mobile/features/search/presentation/widgets/empty_search/empty_search_view.dart';
import 'package:clustranotes_mobile/features/search/presentation/widgets/result_search/fillter_section.dart';
import 'package:clustranotes_mobile/features/search/presentation/widgets/result_search/result_search_view.dart';
import 'package:clustranotes_mobile/features/search/presentation/widgets/search_header.dart';
import 'package:clustranotes_mobile/features/search/presentation/widgets/suggestion_search/suggestion_search_view.dart';
import 'package:flutter/material.dart';

enum SearchViewState {
  empty,
  suggestions,
  results,
}

class SearchScreen extends StatefulWidget{
  const SearchScreen({
    super.key
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchViewState _searchViewState = SearchViewState.empty;
  final TextEditingController _searchController = TextEditingController();
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchHeader(
                controller: _searchController,
                onChanged: (value){
                  setState(() {
                    if(value.trim().isEmpty){
                      _searchViewState = SearchViewState.empty;
                    }
                    else{
                      _searchViewState = SearchViewState.suggestions;
                    }
                  });
                },
                onSubmitted: (value){
                  setState(() {
                    if(value.trim().isNotEmpty){
                      _searchViewState = SearchViewState.results;
                    }
                  });
                },
              ),
              if (_searchViewState ==
                  SearchViewState.results)
                FilterSection(),
              Expanded(
                child: switch(_searchViewState){
                  SearchViewState.empty => const EmptySearchView(),
                  SearchViewState.suggestions => const SuggestionSearchView(),
                  SearchViewState.results => const ResultSearchView(),
                }
              ),
              
            ],
          )
        
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
