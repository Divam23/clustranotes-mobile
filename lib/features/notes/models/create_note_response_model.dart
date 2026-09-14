
class CreateNoteResponseModel {
  final String id;
  final String title;
  final String subject;
  final String course;
  final bool isPublic;
  final int fileSize;
  final DateTime? publishedAt;

  const CreateNoteResponseModel({
    required this.id,
    required this.title,
    required this.subject,
    required this.course,
    required this.fileSize,
    required this.isPublic,
    this.publishedAt, 
  });
}
