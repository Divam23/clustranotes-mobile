import 'package:clustranotes_mobile/features/notes/models/moderation_info.dart';
import 'package:clustranotes_mobile/features/notes/models/note_enums.dart';
import 'package:clustranotes_mobile/features/notes/models/note_file_metadata.dart';
import 'package:clustranotes_mobile/features/notes/models/note_stats.dart';

class Note {
  final String id;
  final String title;
  final String description;
  final String subject;
  final String? branch;
  final NoteCategory category;
  final NoteContentType contentType;
  final List<String>? tags;
  final String course;
  final String? collegeName;
  final String? university;
  final int? semester;
  final String language;
  final NoteFileMetadata file;
  final String? extractedText;
  final String uploaderId;
  final bool isPublic;
  final NotePublishStatus publishStatus;
  final DateTime? publishedAt;
  final DateTime? submittedForReviewAt;
  final DateTime? approvedAt;
  final DateTime? rejectedAt;
  final String? rejectionReason;
  final NoteVerificationPublicStatus noteVerificationStatus;

  final NoteStats stats;
  final ModerationInfo moderation;
  
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
    required this.uploaderId,
    required this.isPublic,
    required this.publishStatus,
    this.publishedAt,
    this.submittedForReviewAt,
    this.approvedAt,
    this.rejectedAt,
    this.rejectionReason,
    required this.noteVerificationStatus,
    required this.stats,
    required this.moderation,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: (json['_id'] ?? json['id']) as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      subject: json['subject'] as String,
      branch: json['branch'] as String?,
      category: NoteCategoryJson.fromJson(json['category'] as String),
      contentType: NoteContentTypeJson.fromJson(json['contentType'] as String),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
      course: json['course'] as String,
      collegeName: json['collegeName'] as String?,
      university: json['university'] as String?,
      semester: (json['semester'] as num?)?.toInt(),
      language: json['language'] as String? ?? 'en',
      file: NoteFileMetadata.fromJson(json['file'] as Map<String, dynamic>),
      extractedText: json['extractedText'] as String?,
      uploaderId: json['uploader'] is Map
          ? (json['uploader'] as Map)['_id'] as String
          : json['uploader'] as String,
      isPublic: json['isPublic'] as bool? ?? true,
      publishStatus: NotePublishStatusJson.fromJson(json['publishStatus'] as String? ?? 'published'),
      publishedAt: json['publishedAt'] != null ? DateTime.parse(json['publishedAt'] as String) : null,
      submittedForReviewAt: json['submittedForReviewAt'] != null
          ? DateTime.parse(json['submittedForReviewAt'] as String) : null,
      approvedAt: json['approvedAt'] != null ? DateTime.parse(json['approvedAt'] as String) : null,
      rejectedAt: json['rejectedAt'] != null ? DateTime.parse(json['rejectedAt'] as String) : null,
      rejectionReason: json['rejectionReason'] as String?,
      noteVerificationStatus: NoteVerificationPublicStatusJson.fromJson(
          json['noteVerificationStatus'] as String? ?? 'community'),
      stats: NoteStats.fromJson(json['stats'] as Map<String, dynamic>?),
      moderation: ModerationInfo.fromJson(json['moderation'] as Map<String, dynamic>?),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'subject': subject,
      if (branch != null) 'branch': branch,
      'category': category.toJson(),
      'contentType': contentType.toJson(),
      'tags': tags,
      'course': course,
      if (collegeName != null) 'collegeName': collegeName,
      'university': university,
      if (semester != null) 'semester': semester,
      'language': language,
      'file': file.toJson(),
      if (extractedText != null) 'extractedText': extractedText,
      'uploader': uploaderId,
      'isPublic': isPublic,
      'publishStatus': publishStatus.toJson(),
      if (publishedAt != null) 'publishedAt': publishedAt!.toIso8601String(),
      if (submittedForReviewAt != null)
        'submittedForReviewAt': submittedForReviewAt!.toIso8601String(),
      if (approvedAt != null) 'approvedAt': approvedAt!.toIso8601String(),
      if (rejectedAt != null) 'rejectedAt': rejectedAt!.toIso8601String(),
      if (rejectionReason != null) 'rejectionReason': rejectionReason,
      'noteVerificationPublicStatus': noteVerificationStatus.toJson(),
      'stats': stats.toJson(),
      'moderation': moderation.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}


