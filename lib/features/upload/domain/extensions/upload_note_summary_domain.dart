import 'package:clustranotes_mobile/features/upload/domain/enums/note_owner_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/models/uploaded_note_summary_model.dart';
import 'package:clustranotes_mobile/features/notes/models/note_enums.dart';

extension UploadedNoteSummaryDomain on UploadedNoteSummary {
    NoteOwnerStatus get ownerStatus {
    switch (publishStatus) {
      case NotePublishStatus.draft:
        return NoteOwnerStatus.draft;

      case NotePublishStatus.archived:
        return NoteOwnerStatus.archived;

      case NotePublishStatus.removed:
        return NoteOwnerStatus.removed;

      case NotePublishStatus.published:
        switch (noteVerificationStatus) {

          case NoteVerificationPrivateStatus.unverified:
            return NoteOwnerStatus.unverified;

          case NoteVerificationPrivateStatus.pendingReview:
            return NoteOwnerStatus.pendingReview;

          case NoteVerificationPrivateStatus.verified:
            return NoteOwnerStatus.verified;

          case NoteVerificationPrivateStatus.rejected:
            return NoteOwnerStatus.rejected;
        }
    }
  }

  String get publicStatus {
    return noteVerificationStatus == NoteVerificationPrivateStatus.verified
        ? 'Verified'
        : 'Community';
  }
  

}
