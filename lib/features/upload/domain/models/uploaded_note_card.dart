import 'package:clustranotes_mobile/core/api/models/note_content_type_enum.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_category_enums.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_publish_status_enums.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_verification_status_enums.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_file.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_stats.dart';

class UploadedNoteCard {
  final String id;
  final String title;
  final String subject;
  final NoteCategoryEnum category;
  final bool isPublic;
  final NoteContentType noteContentType;
  final UploadedNoteFile file;
  final UploadedNoteStats stats;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final NotePublishStatus notePublishStatus;
  final NoteVerificationStatus noteVerificationStatus;
  final DateTime? publishedAt;
  final DateTime? submittedForReviewAt;
  final DateTime? approvedAt;
  final DateTime? rejectedAt;
  final String? rejectionReason;

  const UploadedNoteCard({
    required this.id,
    required this.title,
    required this.subject,
    required this.category,
    required this.isPublic,
    required this.noteContentType,
    required this.file,
    required this.stats,
    required this.createdAt,
    this.updatedAt,
    required this.notePublishStatus,
    required this.noteVerificationStatus,
    this.publishedAt,
    this.submittedForReviewAt,
    this.approvedAt,
    this.rejectedAt,
    this.rejectionReason,
  });
}
