import 'package:clustranotes_mobile/features/notes/domain/enums/note_category_enums.dart';

class CollectionSummary {
  final String id;
  final String title;
  final String subtitle;
  final NoteCategoryEnum type;
  final int notesCount;
  final String? coverImageUrl;
  final List<String> noteIds;
  
  const CollectionSummary({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.notesCount,
    this.coverImageUrl,
    required this.noteIds
  });
}
