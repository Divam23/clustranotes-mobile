import 'package:clustranotes_mobile/features/upload/data/models/note_list_filter.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_owner_status_enum.dart';

class NoteOwnerStatusMapper {
  const NoteOwnerStatusMapper._();

  static NoteListFilters noteListFilterMapper(NoteOwnerStatus filter) {
    switch (filter) {
      case NoteOwnerStatus.unverified:
        return NoteListFilters(
          notePublishStatus: null,
          noteVerificationStatus: "unverified",
        );

      case NoteOwnerStatus.verified:
        return NoteListFilters(
          notePublishStatus: null,
          noteVerificationStatus: "verified",
        );

      case NoteOwnerStatus.rejected:
        return NoteListFilters(
          notePublishStatus: null,
          noteVerificationStatus: "rejected",
        );

      case NoteOwnerStatus.pendingReview:
        return NoteListFilters(
          notePublishStatus: null,
          noteVerificationStatus: "pending_review",
        );

      case NoteOwnerStatus.draft:
        return NoteListFilters(
          notePublishStatus: "draft",
          noteVerificationStatus: null,
        );

      case NoteOwnerStatus.removed:
        return NoteListFilters(
          notePublishStatus: "removed",
          noteVerificationStatus: null,
        );

      case NoteOwnerStatus.archived:
        return NoteListFilters(
          notePublishStatus: "archived",
          noteVerificationStatus: null,
        );
    }
  }
}
