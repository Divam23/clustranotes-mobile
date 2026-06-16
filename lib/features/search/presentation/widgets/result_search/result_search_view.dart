import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/search/data/result_search_dummy_data.dart';
import 'package:clustranotes_mobile/features/search/presentation/widgets/result_search/search_result_note_card.dart';
import 'package:flutter/material.dart';

class ResultSearchView extends StatelessWidget{
  const ResultSearchView({super.key});

  @override
  Widget build(BuildContext context){
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.xs,
        AppSpacing.sm,
        AppSpacing.xs,
        AppSpacing.screenPadding,
      ),
      itemCount: resultSearchItems.length,

      itemBuilder: (context, index) {
        return SearchResultNoteCard(
          item: resultSearchItems[index],
        );
      },

      separatorBuilder: (context, index) {
        return const SizedBox(
          height: AppSpacing.sm,
        );
      },
    );
  }
}
