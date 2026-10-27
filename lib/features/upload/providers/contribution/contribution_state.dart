import 'package:clustranotes_mobile/core/errors/app_failure.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_owner_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/upload_loading_action.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/note_status_stats.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_card.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_summary_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'contribution_state.freezed.dart';

@freezed
abstract class ContributionState with _$ContributionState{
  const factory ContributionState({
    @Default([]) List<UploadedNoteSummary> notesSummary,
    @Default([]) List<UploadedNoteCard> notes,
    NoteStatusStats? noteStatusStats,
    NoteOwnerStatus? selectedStatus,
    @Default(UploadLoadingAction.idle) uploadLoadingAction, 
    @Default(false) bool isLoading,
    @Default(false) bool isExpanded,
    AppFailure? error,
    @Default(false) bool isRefreshing,
    @Default(1) int currentPage,
    @Default(15) int pageSize,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasReachedEnd,
    
  })= _ContributionState;
}
