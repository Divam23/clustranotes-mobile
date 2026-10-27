import 'package:clustranotes_mobile/features/upload/domain/enums/note_owner_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_summary_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'my_upload_state.freezed.dart';

@freezed
abstract class ContributionState with _$ContributionState{
  const factory ContributionState({
    @Default([]) List<UploadedNoteSummary> notes,
    NoteOwnerStatus? selectedStatus,
    @Default(false) bool isLoading,
    @Default(false) bool isExpanded,
    String? error,
    @Default(false) bool isRefreshing,
    @Default(false) bool hasReachedEnd,
    String? nextCursor,
    
  })= _ContributionState;
}
