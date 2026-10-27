import 'package:clustranotes_mobile/features/upload/data/models/note_status_stats_dto.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_owner_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/note_status_stats.dart';

int? getStatusCount( NoteOwnerStatus? noteOwnerStatus, NoteStatusStats? stats ) {
  switch (noteOwnerStatus) {
    case NoteOwnerStatus.draft:
      return stats?.draftNotesCount;
    case NoteOwnerStatus.unverified:
      return stats?.unverifiedNotesCount;
    case NoteOwnerStatus.archived:
      return stats?.archivedNotesCount;
    case NoteOwnerStatus.verified:
      return stats?.verifiedNotesCount;
    case NoteOwnerStatus.pendingReview:
      return stats?.pendingReviewNotesCount;
    case NoteOwnerStatus.removed:
      return stats?.removedNotesCount;
    case NoteOwnerStatus.rejected:
      return stats?.rejectedNotesCount;
    default:
      return stats?.totalNotesCount;
  }
}
