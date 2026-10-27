import 'package:clustranotes_mobile/core/api/models/note_content_type_enum.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_publish_status_enums.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_verification_status_enums.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/note_stats_model.dart';

class UploadedNoteSummary {
  final String id;
  final String title;
  final String? thumbnailUrl;
  final NotePublishStatus publishStatus;
  final NoteVerificationPrivateStatus noteVerificationStatus;
  final NoteContentType? noteContentType;
  final NoteStatsModel? noteStats;
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
    this.thumbnailUrl,
    required this.publishStatus,
    required this.noteVerificationStatus,
    this.noteStats,
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

