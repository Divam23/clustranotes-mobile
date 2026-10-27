import 'package:clustranotes_mobile/features/upload/data/models/note_status_stats_dto.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/note_status_stats.dart';

class NoteStatusStatsMapper {
  const NoteStatusStatsMapper._();
  
  static NoteStatusStats noteStatusStatsMapper(NoteStatusStatsDto dto){
    return NoteStatusStats(
      totalNotesCount: dto.total,
      draftNotesCount: dto.draft,
      publishedNotesCount: dto.published,
      archivedNotesCount: dto.archived,
      removedNotesCount: dto.removed,
      deletedNotesCount: dto.deleted,
      unverifiedNotesCount: dto.unverified,
      pendingReviewNotesCount: dto.pendingReview,
      rejectedNotesCount: dto.rejected,
      verifiedNotesCount: dto.verified
    );
  }
}
