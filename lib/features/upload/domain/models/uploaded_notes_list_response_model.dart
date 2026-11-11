import 'package:clustranotes_mobile/features/upload/domain/models/pagination_info.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_card.dart';

class UploadedNotesListResponseModel {
  final List<UploadedNoteCard> notes;
  final PaginationInfo paginationInfo;
  const UploadedNotesListResponseModel({required this.notes, required this.paginationInfo});
}
