import 'package:clustranotes_mobile/features/notes/models/note_enums.dart';
import 'package:clustranotes_mobile/features/upload/models/upload_file.dart';

class UploadDraft{
  final UploadFile? file;
  final String title;
  final String description;
  final String? subject;
  final String? branch;
  final NoteCategory? category;
  final List<String> tags;
  final String? course;
  final String? collegeName;
  final String? university;
  final int? semester;
  final bool isPublic;
  
  const UploadDraft({
    this.file,
    this.title="",
    this.description="",
    this.subject,
    this.branch,
    this.category,
    this.tags = const [],
    this.course,
    this.collegeName,
    this.university,
    this.semester,
    this.isPublic = true
  });
}
