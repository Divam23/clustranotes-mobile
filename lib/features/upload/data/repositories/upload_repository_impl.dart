import 'package:clustranotes_mobile/features/upload/data/datasource/upload_remote_datasource.dart';
import 'package:clustranotes_mobile/features/upload/data/mapper/note_status_stats_dto_to_domain_stats.mapper.dart';
import 'package:clustranotes_mobile/features/upload/data/mapper/uploaded_note_list_dto_to_domain.mapper.dart';
import 'package:clustranotes_mobile/features/upload/data/models/note_list_filter.dart';
import 'package:clustranotes_mobile/features/upload/data/models/uploaded_notes_list_response_dto.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/note_status_stats.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/pagination_params.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_notes_list_response_model.dart';
import 'package:clustranotes_mobile/features/upload/domain/repositories/upload_repository.dart';

class UploadRepositoryImpl implements UploadRepository {
  final UploadRemoteDataSource _uploadRemoteDataSource;

  UploadRepositoryImpl(this._uploadRemoteDataSource);

  @override
  Future<UploadedNotesListResponseModel> getUserUploadedNotes({NoteListFilters? filter, required PaginationParams pagination}) async {
    final getUploadedNotes = await _uploadRemoteDataSource.getUserUploadedNotes(filter: filter, pagination: pagination);
    return UploadedNoteListDtoToDomainMapper.uploadedNoteListMapper(getUploadedNotes);
  }
  
  @override
  Future<NoteStatusStats> getNoteStatusStats()async{
    final getUserNoteStatusStats = await _uploadRemoteDataSource.getNoteStatusStats();
    
    return NoteStatusStatsMapper.noteStatusStatsMapper(getUserNoteStatusStats);
  }
}
