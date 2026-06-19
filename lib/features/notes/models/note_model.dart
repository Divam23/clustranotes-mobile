import 'package:clustranotes_mobile/features/notes/models/note_file.dart';
import 'package:clustranotes_mobile/features/notes/models/note_stats.dart';

///See this is just initial model this will be expanded as we move deep

class Note {
  final String id;

  final String title;
  final String description;
  final String subject;

  final String category;
  final String contentType;

  final List<String> tags;

  final String? course;
  final String? university;
  final int? semester;

  final String language;

  final NoteFile file;

  final String uploaderId;
  final String uploaderName;
  final String? uploaderAvatar;

  final bool isPublic;
  final String status;
  final bool isVerifiedNote;
  final NoteVerificationStatus noteVerificationStatus;

  final NoteStats stats;

  final DateTime? publishedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Note({
    required this.id,
    required this.title,
    required this.description,
    required this.subject,
    required this.category,
    required this.contentType,
    required this.tags,
    this.course,
    this.university,
    this.semester,
    required this.language,
    required this.file,
    required this.uploaderId,
    required this.uploaderName,
    this.uploaderAvatar,
    required this.isPublic,
    required this.status,
    required this.isVerifiedNote,
    required this.noteVerificationStatus,
    required this.stats,
    this.publishedAt,
    required this.createdAt,
    required this.updatedAt,
  });
}

enum NoteVerificationStatus{
  community,
  verified
}
