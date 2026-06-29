import 'package:clustranotes_mobile/features/notes/models/note_enums.dart';
import 'package:clustranotes_mobile/features/upload/models/uploaded_note_summary_model.dart';

final dummyUploadedNotes = [
  // 1. Fresh draft — never submitted, no review timestamps at all
  UploadedNoteSummary(
    id: 'note_101',
    title: 'Untitled Draft - Calculus Notes',
    publishStatus: NotePublishStatus.draft,
    noteVerificationStatus: NoteVerificationPrivateStatus.unverified,
    noteContentType: NoteContentType.pptx,
    updatedAt: DateTime(2026, 6, 24), 
    createdAt: DateTime(2026, 6, 23),
  ),

  // 2. Published, never submitted for verification — default state
  UploadedNoteSummary(
    id: 'note_102',
    title: 'DBMS Normalization Cheat Sheet',
    publishStatus: NotePublishStatus.published,
    noteVerificationStatus: NoteVerificationPrivateStatus.unverified,
    updatedAt: DateTime(2026, 5, 1),
    createdAt: DateTime(2026, 6, 23),
  ),

  // 3. Published, submitted, currently pending review
  UploadedNoteSummary(
    id: 'note_103',
    title: 'Operating Systems Process Scheduling',
    publishStatus: NotePublishStatus.published,
    noteVerificationStatus: NoteVerificationPrivateStatus.pendingReview,
    updatedAt: DateTime(2026, 6, 20),
    submittedForReviewAt: DateTime(2026, 6, 20),
    createdAt: DateTime(2026, 6, 23),
  ),

  // 4. Published and verified — full happy path with all timestamps
  UploadedNoteSummary(
    id: 'note_104',
    title: 'Thermodynamics Complete Notes',
    publishStatus: NotePublishStatus.published,
    noteVerificationStatus: NoteVerificationPrivateStatus.verified,
    updatedAt: DateTime(2026, 2, 16),
    submittedForReviewAt: DateTime(2026, 2, 15),
    approvedAt: DateTime(2026, 2, 16),
    createdAt: DateTime(2026, 6, 23),
  ),

  // 5. Published but rejected — has reason, note still live (per our design:
  // rejection never flips isPublic, only affects the badge)
  UploadedNoteSummary(
    id: 'note_105',
    title: 'Linear Algebra Assignment Solutions',
    publishStatus: NotePublishStatus.published,
    noteVerificationStatus: NoteVerificationPrivateStatus.rejected,
    updatedAt: DateTime(2026, 6, 12),
    submittedForReviewAt: DateTime(2026, 6, 11),
    rejectedAt: DateTime(2026, 6, 12),
    createdAt: DateTime(2026, 6, 23),
    rejectionReason: 'Content overlaps significantly with an existing verified note.',
  ),

  // 6. Resubmitted after a previous rejection — now pending again.
  // Tests that stale rejectedAt/rejectionReason get cleared on resubmit
  // (per submitForVerification() clearing them), so this should show
  // "Pending Review", NOT leak the old rejection reason.
  UploadedNoteSummary(
    id: 'note_106',
    title: 'Macroeconomics Unit 1-3 Summary',
    publishStatus: NotePublishStatus.published,
    noteVerificationStatus: NoteVerificationPrivateStatus.pendingReview,
    createdAt: DateTime(2026, 6, 23),
    updatedAt: DateTime(2026, 6, 23),
    submittedForReviewAt: DateTime(2026, 6, 23),
    rejectedAt: null,
    rejectionReason: null,
  ),

  // 7. Archived — uploader hid this themselves.
  // EXPOSES THE BUG: ownerStatus switch has no case for `archived`,
  // so this will currently fall through to showing "Verified" instead
  // of something like "Hidden by you".
  UploadedNoteSummary(
    id: 'note_107',
    title: 'Old Semester 2 Physics Notes (Outdated)',
    publishStatus: NotePublishStatus.archived,
    noteVerificationStatus: NoteVerificationPrivateStatus.verified,
    updatedAt: DateTime(2026, 4, 1),
    submittedForReviewAt: DateTime(2026, 1, 5),
    approvedAt: DateTime(2026, 1, 6),
    createdAt: DateTime(2026, 6, 23),
  ),

  // 8. Removed by a moderator — takedown case.
  // Also exposes the same gap: falls through to "Unverified" rather
  // than communicating this was an admin removal.
  UploadedNoteSummary(
    id: 'note_108',
    title: 'Copied PYQ Set (Flagged Content)',
    publishStatus: NotePublishStatus.removed,
    noteVerificationStatus: NoteVerificationPrivateStatus.unverified,
    updatedAt: DateTime(2026, 6, 5),
    createdAt: DateTime(2026, 6, 23),
  ),
];
