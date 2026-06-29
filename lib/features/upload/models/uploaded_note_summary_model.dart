import 'package:clustranotes_mobile/features/notes/models/note_enums.dart';

class UploadedNoteSummary {
  final String id;
  final String title;
  final NotePublishStatus publishStatus;
  final NoteVerificationPrivateStatus noteVerificationStatus;
  final NoteContentType? noteContentType;
  final DateTime createdAt;
  final DateTime? publishedAt;
  final DateTime updatedAt;
  final DateTime? submittedForReviewAt;
  final DateTime? approvedAt;
  final DateTime? rejectedAt;
  final String? rejectionReason;

  const UploadedNoteSummary({
    required this.id,
    required this.title,
    required this.publishStatus,
    required this.noteVerificationStatus,
    required this.createdAt,
    this.publishedAt,
    this.noteContentType,
    required this.updatedAt,
    this.submittedForReviewAt,
    this.approvedAt,
    this.rejectedAt,
    this.rejectionReason,
  });
}

