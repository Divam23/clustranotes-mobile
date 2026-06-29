import 'package:clustranotes_mobile/features/upload/domain/enums/note_owner_status_enum.dart';

extension NoteOwnerStatusUI on NoteOwnerStatus{
  String get timelineInfo{
    switch(this){
      case NoteOwnerStatus.draft:
        return 'Started';

      case NoteOwnerStatus.archived:
        return 'Hidden by you';

      case NoteOwnerStatus.removed:
        return 'Removed by Admin';

      case NoteOwnerStatus.unverified:
        return 'Uploaded';

      case NoteOwnerStatus.verified:
        return 'Verified';

      case NoteOwnerStatus.pendingReview:
        return 'Submitted';

      case NoteOwnerStatus.rejected:
        return 'Rejected';

    }
  }
}
