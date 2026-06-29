import 'package:clustranotes_mobile/app/theme/app_colors.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_owner_status_enum.dart';
import 'package:flutter/material.dart';

extension NoteOwnerStatusUI on NoteOwnerStatus {

  Color get color {
    switch (this) {
      case NoteOwnerStatus.verified:
        return AppColors.success;

      case NoteOwnerStatus.pendingReview:
        return AppColors.warning;

      case NoteOwnerStatus.rejected:
      case NoteOwnerStatus.removed:
        return AppColors.error;

      case NoteOwnerStatus.unverified:
        return AppColors.info;

      case NoteOwnerStatus.draft:
      case NoteOwnerStatus.archived:
        return AppColors.neutral;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case NoteOwnerStatus.verified:
        return AppColors.successBackground;

      case NoteOwnerStatus.pendingReview:
        return AppColors.warningBackground;

      case NoteOwnerStatus.rejected:
      case NoteOwnerStatus.removed:
        return AppColors.errorBackground;

      case NoteOwnerStatus.unverified:
        return AppColors.infoBackground;

      case NoteOwnerStatus.draft:
      case NoteOwnerStatus.archived:
        return AppColors.neutralBackground;
    }
  }
}
