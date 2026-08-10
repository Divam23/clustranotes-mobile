import 'dart:ui';
import 'package:clustranotes_mobile/app/theme/app_colors.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_owner_status_enum.dart';

extension UploadFilterExtension on NoteOwnerStatus {
  String get label {
    switch (this) {
      case NoteOwnerStatus.draft:
        return "Draft";
        
      case NoteOwnerStatus.unverified:
        return "Unverified";
        
      case NoteOwnerStatus.rejected:
        return "Rejected";
        
      case NoteOwnerStatus.removed:
        return "Removed";
        
      case NoteOwnerStatus.pendingReview:
        return "Pending Review";

      case NoteOwnerStatus.verified:
        return "Verified";

      case NoteOwnerStatus.archived:
        return "Archived";
    }
  }

  Color? get indicatorColor {
    switch (this) {
      case NoteOwnerStatus.verified:
        return AppColors.success;

      case NoteOwnerStatus.pendingReview:
        return AppColors.warning;

      case NoteOwnerStatus.rejected:
        return AppColors.error;

      case NoteOwnerStatus.unverified:
        return AppColors.primary;

      default:
        return null;
    }
  }
}
