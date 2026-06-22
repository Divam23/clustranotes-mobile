import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/core/widgets/search_bar.dart';
import 'package:clustranotes_mobile/features/explore/presentation/widgets/explore_header/explore_header.dart';
import 'package:clustranotes_mobile/features/explore/presentation/widgets/trending_section/trending_section.dart';
import 'package:clustranotes_mobile/features/notes/data/notecard_dummy_data.dart';
import 'package:clustranotes_mobile/features/search/presentation/pages/search_screen.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = dummyNoteCards;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: FocusManager.instance.primaryFocus?.unfocus,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.screenPadding,
                horizontal: AppSpacing.screenPadding,
              ),
              child: Column(
                children: [
                  ExploreHeader(),
                  SizedBox(height: AppSpacing.itemGap,),
                  AppSearchBar(
                    readOnly: true,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> const SearchScreen())
                      );
                    },
                  ),
                  const SizedBox(height: AppSpacing.sectionGap,),
                  TrendingSection(notes: [...dummyNoteCards],),
                  const SizedBox(height: AppSpacing.sectionGap,),
                  
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
