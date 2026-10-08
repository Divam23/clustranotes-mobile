import 'package:clustranotes_mobile/core/api/models/note_content_type_enum.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_category_enums.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_publish_status_enums.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_verification_status_enums.dart';
import 'package:clustranotes_mobile/features/upload/data/models/uploaded_note_file_dto.dart';
import 'package:clustranotes_mobile/features/upload/data/models/uploaded_note_stats_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'uploaded_note_card_dto.g.dart';

@JsonSerializable()
class UploadedNoteCardDto {
  final String id;
  final String title;
  final String subject;
  final NoteCategoryEnum category;
  final bool isPublic;
  final NoteContentType noteContentType;
  final UploadedNoteFileDto file;
  final UploadedNoteStatsDto stats;
  final DateTime createdAt;
  final DateTime updatedAt;
  final NotePublishStatus notePublishStatus;
  final NoteVerificationStatus noteVerificationStatus;
  final DateTime publishedAt;
  final DateTime submittedForReviewAt;
  final DateTime approvedAt;
  final DateTime rejectedAt;
  final String rejectionReason;

  const UploadedNoteCardDto({
    required this.id,
    required this.title,
    required this.subject,
    required this.category,
    required this.isPublic,
    required this.noteContentType,
    required this.file,
    required this.stats,
    required this.createdAt,
    required this.updatedAt,
    required this.notePublishStatus,
    required this.noteVerificationStatus,
    required this.publishedAt,
    required this.submittedForReviewAt,
    required this.approvedAt,
    required this.rejectedAt,
    required this.rejectionReason,
  });
  
  factory UploadedNoteCardDto.fromJson(Map<String, dynamic> json) => _$UploadedNoteCardDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UploadedNoteCardDtoToJson(this);
}
