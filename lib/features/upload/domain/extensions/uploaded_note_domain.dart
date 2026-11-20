import 'package:clustranotes_mobile/features/upload/domain/enums/note_owner_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_card.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_publish_status_enums.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_verification_status_enums.dart';

extension UploadedNoteDomain on UploadedNoteCard {
  NoteOwnerStatus get ownerStatus {
    switch (notePublishStatus) {
      case NotePublishStatus.draft:
        return NoteOwnerStatus.draft;

      case NotePublishStatus.archived:
        return NoteOwnerStatus.archived;

      case NotePublishStatus.removed:
        return NoteOwnerStatus.removed;

      case NotePublishStatus.published:
        switch (noteVerificationStatus.privateStatus) {

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
    return noteVerificationStatus.isVerified
        ? 'Verified'
        : 'Community';
  }

}
