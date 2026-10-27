import 'package:clustranotes_mobile/features/upload/data/models/note_list_filter.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/note_status_stats.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_card.dart';

abstract interface class UploadRepository {
 Future<List<UploadedNoteCard>> getUserUploadedNotes({NoteListFilters? filter});
 
 Future<NoteStatusStats> getNoteStatusStats();
}
