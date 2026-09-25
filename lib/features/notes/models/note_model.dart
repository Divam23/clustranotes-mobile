import 'package:clustranotes_mobile/core/api/models/note_content_type_enum.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_category_enums.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_publish_status_enums.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_verification_status_enums.dart';
import 'package:clustranotes_mobile/features/notes/models/moderation_info.dart';
import 'package:clustranotes_mobile/features/notes/models/note_file_metadata.dart';
import 'package:clustranotes_mobile/features/notes/models/note_stats.dart';
import 'package:clustranotes_mobile/features/user/domain/models/user_summary.dart';

class Note {
  final String id;
  final String title;
  final String description;
  final String subject;
  final String? branch;
  final NoteCategoryEnum category;
  final NoteContentType contentType;
  final List<String>? tags;
  final String course;
  final String? collegeName;
  final String? university;
  final int? semester;
  final String language;
  final NoteFileMetadata file;
  final String? extractedText;
  final UserSummary uploader;
  final bool isPublic;
  final NotePublishStatus publishStatus;
  final DateTime? publishedAt;
  final DateTime? submittedForReviewAt;
  final DateTime? approvedAt;
  final DateTime? rejectedAt;
  final String? rejectionReason;
  final NoteVerificationPublicStatus noteVerificationStatus;

  final NoteStats stats;
  final ModerationInfo? moderation;
  
  final DateTime createdAt;
  final DateTime updatedAt;

  const Note({
    required this.id,
    required this.title,
    required this.description,
    required this.subject,
    this.branch,
    required this.category,
    required this.contentType,
    this.tags,
    required this.course,
    this.collegeName,
    this.university,
    this.semester,
    required this.language,
    required this.file,
    this.extractedText,
    required this.uploader,
    required this.isPublic,
    required this.publishStatus,
    this.publishedAt,
    this.submittedForReviewAt,
    this.approvedAt,
    this.rejectedAt,
    this.rejectionReason,
    required this.noteVerificationStatus,
    required this.stats,
    this.moderation,
    required this.createdAt,
    required this.updatedAt,
  });
}


