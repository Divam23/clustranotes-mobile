import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_card.dart';

abstract interface class UploadRepository {
 Future<UploadedNoteCard> getUserUploadedNotes({
   required String userId
});
}
