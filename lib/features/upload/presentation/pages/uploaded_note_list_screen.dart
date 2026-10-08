import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/core/widgets/button/app_back_button.dart';
import 'package:clustranotes_mobile/features/upload/data/dummy_uploaded_note_cards.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_owner_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/uploaded_note_list_screen_widgets/note_status_filter_chip.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/uploaded_note_list_screen_widgets/uploaded_note_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadedNoteListScreen extends ConsumerWidget {
  const UploadedNoteListScreen({
    super.key
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textScaler = MediaQuery.textScalerOf(context);
    final listHeight = textScaler.scale(230.0).clamp(230.0, 300.0);
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        centerTitle: false,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("My Uploads", style: theme.textTheme.titleLarge),
            Text(
              "Manage and track all your uploads",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding,
                  vertical: AppSpacing.md
                ),
                child: Row(
                  spacing: AppSpacing.md,
                  children: NoteOwnerStatus.values.map(
                      (filter){
                        return NoteStatusFilterChip(
                          filter: filter, 
                          count: 100,
                        );
                      }
                  ).toList()
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding,
                  vertical: AppSpacing.md
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: dummyUploadedNoteCards.length,
                separatorBuilder: (_,__) => const SizedBox(height: AppSpacing.md),
                itemBuilder: (context, index) {
                  return UploadedNoteCardWidget(
                    note: dummyUploadedNoteCards[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
