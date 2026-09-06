import 'package:clustranotes_mobile/core/models/note_content_type_enum.dart';
import 'package:clustranotes_mobile/features/notes/data/models/create_note_response_stats_dto.dart';
import 'package:clustranotes_mobile/features/notes/data/models/note_file_dto.dart';
import 'package:clustranotes_mobile/features/notes/data/models/note_uploader_dto.dart';
import 'package:clustranotes_mobile/features/notes/models/note_enums.dart';
import 'package:json_annotation/json_annotation.dart';
part 'create_note_response_dto.g.dart';

@JsonSerializable()
class CreateNoteResponseDto {
  final String id;
  final String title;
  final String description;
  final String subject;
  final NoteCategory category;
  final List<String>? tags;
  final String course;
  final String? branch;
  final String? college;
  final String? university;
  final int? semester;
  final String language;
  final NoteContentType contentType;
  
  final NoteFileDto file;
  final CreateNoteResponseStatsDto stats;
  final NoteUploaderDto uploader;
  
  final bool isPublic;
  final NoteVerificationPublicStatus noteVerificationPublicStatus;
  final NotePublishStatus notePublishStatus;
  final DateTime? publishedAt;
  final bool isLiked;
  final bool isBookmarked;
  final bool isOwner;
  final DateTime createdAt;
  final DateTime updatedAt;
  
  const CreateNoteResponseDto({
    required this.id,
    required this.title,
    required this.description,
    required this.subject,
    required this.category,
    this.tags,
    required this.course,
    this.branch,
    this.college,
    this.university,
    this.semester,
    required this.language,
    required this.contentType,
    required this.file,
    required this.stats,
    required this.uploader,
    required this.isPublic,
    required this.noteVerificationPublicStatus,
    required this.notePublishStatus,
    this.publishedAt,
    required this.isLiked,
    required this.isBookmarked,
    required this.isOwner,
    required this.createdAt,
    required this.updatedAt,
  });
  
  factory CreateNoteResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CreateNoteResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateNoteResponseDtoToJson(this);
}
