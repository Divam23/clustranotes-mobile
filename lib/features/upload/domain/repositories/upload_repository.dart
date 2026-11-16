import 'package:clustranotes_mobile/features/upload/data/models/note_list_filter.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/note_status_stats.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/pagination_params.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_notes_list_response_model.dart';
import 'package:dio/dio.dart';

abstract interface class UploadRepository {
  Future<UploadedNotesListResponseModel> getUserUploadedNotes({
    NoteListFilters? filter,
    required PaginationParams pagination,
    CancelToken? cancelToken,
  });

  Future<NoteStatusStats> getNoteStatusStats();
}
