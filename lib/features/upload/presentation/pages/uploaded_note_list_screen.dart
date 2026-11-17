import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/core/widgets/button/app_back_button.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_owner_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_card.dart';
import 'package:clustranotes_mobile/features/upload/presentation/extension/getStatusCount.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/uploaded_note_list_screen_widgets/note_status_filter_chip.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/uploaded_note_list_screen_widgets/uploaded_note_card_widget.dart';
import 'package:clustranotes_mobile/features/upload/providers/contribution_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UploadedNoteListScreen extends ConsumerStatefulWidget {
  const UploadedNoteListScreen({super.key});

  @override
  ConsumerState<UploadedNoteListScreen> createState() =>
      _UploadedNoteListScreenState();
}

class _UploadedNoteListScreenState
    extends ConsumerState<UploadedNoteListScreen> {
  
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      if (!mounted) return;

      final stats = ref.read(contributionProvider).noteStatusStats;

      if (stats == null) {
        ref.read(contributionProvider.notifier).getNoteStatusStats();
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final contributionState = ref.watch(contributionProvider);
    final stats = contributionState.noteStatusStats;
    
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
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(contributionProvider.notifier).pagingController.refresh();
          await ref.read(contributionProvider.notifier).getNoteStatusStats();
        },
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        child: SafeArea(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenPadding,
                    vertical: AppSpacing.md,
                  ),
                  child: Row(
                    spacing: AppSpacing.md,
                    children: NoteOwnerStatus.values.map((status) {
                      return NoteStatusFilterChip(
                        filter: status,
                        isLoading: stats == null,
                        count: getStatusCount(status, stats),
                        isSelected: contributionState.selectedStatus == status,
                        onTap: () => ref.read(contributionProvider.notifier).changeFilter(status),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Expanded(
                child: PagingListener<int, UploadedNoteCard>(
                  controller: ref.read(contributionProvider.notifier).pagingController,
                  builder: (context, state, fetchNextPage){
                    return PagedListView<int, UploadedNoteCard>.separated(
                        state: state,
                        fetchNextPage: fetchNextPage,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.screenPadding,
                          vertical: AppSpacing.md,
                        ),
                        physics: const AlwaysScrollableScrollPhysics(),
                        builderDelegate: PagedChildBuilderDelegate<UploadedNoteCard>(
                          itemBuilder: (context, note, index){
                            return UploadedNoteCardWidget(note: note);
                          },
                          noItemsFoundIndicatorBuilder: (context){
                              return const Center(
                                child: Text("No Notes found"),
                              );
                          },
                          firstPageProgressIndicatorBuilder: (context) {
                            return const Center(
                              child: CircularProgressIndicator(strokeWidth: 3),
                            );
                          },
                        ),
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: AppSpacing.md);
                      },
                    );
                  },
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
