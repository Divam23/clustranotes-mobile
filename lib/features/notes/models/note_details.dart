import 'package:clustranotes_mobile/features/notes/models/note_model.dart';

class NoteDetails {
  final Note note;

  final String? uploaderName;

  final String? uploaderAvatar;

  final bool isBookmarked;

  final bool isDownloaded;

  final bool canDownload;

  final DateTime createdAt;
  
  const NoteDetails({
    required this.note,
    this.uploaderName,
    this.uploaderAvatar,
    required this.isBookmarked,
    required this.canDownload,
    required this.createdAt,
    required this.isDownloaded
});
}
