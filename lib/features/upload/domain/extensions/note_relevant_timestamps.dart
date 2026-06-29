import 'package:clustranotes_mobile/features/notes/models/note_enums.dart';
import 'package:clustranotes_mobile/features/upload/domain/entities/note_status_timestamps.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_timestamps_enum.dart';
import 'package:clustranotes_mobile/features/upload/models/uploaded_note_summary_model.dart';

extension UploadedNoteSummaryDomain on UploadedNoteSummary {
  NoteStatusTimestamps get statusTimestamp {
    switch (publishStatus) {
      case NotePublishStatus.draft:
        return NoteStatusTimestamps(
          event: NoteTimestampsEvent.started,
          timestamp: createdAt,
        );

      case NotePublishStatus.archived:
        return NoteStatusTimestamps(
          event: NoteTimestampsEvent.hidden,
          timestamp: updatedAt,
        );

      case NotePublishStatus.removed:
        return NoteStatusTimestamps(
          event: NoteTimestampsEvent.removed,
          timestamp: updatedAt,
        );

      case NotePublishStatus.published:
        switch (noteVerificationStatus) {
          case NoteVerificationPrivateStatus.unverified:
            return NoteStatusTimestamps(
              event: NoteTimestampsEvent.uploaded,
              timestamp: publishedAt ?? updatedAt,
            );

          case NoteVerificationPrivateStatus.pendingReview:
            return NoteStatusTimestamps(
              event: NoteTimestampsEvent.submitted,
              timestamp: submittedForReviewAt ?? updatedAt,
            );

          case NoteVerificationPrivateStatus.verified:
            return NoteStatusTimestamps(
              event: NoteTimestampsEvent.verified,
              timestamp: approvedAt ?? updatedAt,
            );

          case NoteVerificationPrivateStatus.rejected:
            return NoteStatusTimestamps(
              event: NoteTimestampsEvent.rejected,
              timestamp: rejectedAt ?? updatedAt,
            );
        }
    }
  }
}
