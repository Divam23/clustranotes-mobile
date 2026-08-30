import 'package:clustranotes_mobile/features/user/domain/models/user_summary.dart';
import 'package:clustranotes_mobile/features/notes/models/note_model.dart';

class NoteDetails {
  final Note note;
  final UserSummary user;
  
  const NoteDetails({
    required this.note,
    required this.user
  });
}
