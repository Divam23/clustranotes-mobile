import 'package:clustranotes_mobile/features/notes/models/note_model.dart';

class NoteCardModel{
  final String id;
  final String title;
  final String? description;
  final String subject;
  final String? branch;
  final String course;
  final String category;
  final String contentType;
  final int? semester;
  final List<String>? tags;
  final String? collegeName;
  final String? university;
  final int sizeInBytes ;
  final String? thumbnailUrl;
  final int pageCount;
  final int downloadCount;
  final int likeCount;
  final int viewCount;
  final bool isBookmarked;
  final bool isPublic;
  final bool isVerifiedNote;
  final NoteVerificationStatus noteVerificationStatus;
  final DateTime createdAt;
  final String uploaderId;
  
  const NoteCardModel({
    required this.id,
    required this.title,
    this.description,
    required this.subject,
    this.branch,
    required this.course,
    required this.category,
    required this.contentType,
    this.semester,
    this.tags,
    this.collegeName,
    this.university,
    required this.sizeInBytes,
    this.thumbnailUrl,
    required this.pageCount,
    required this.downloadCount,
    required this.likeCount,
    required this.viewCount,
    required this.isBookmarked,
    required this.isPublic,
    required this.isVerifiedNote,
    required this.noteVerificationStatus,
    required this.createdAt,
    required this.uploaderId
  });
}
