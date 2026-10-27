import 'package:clustranotes_mobile/features/upload/data/datasource/upload_remote_datasource.dart';
import 'package:clustranotes_mobile/features/upload/data/mapper/note_status_stats_dto_to_domain_stats.mapper.dart';
import 'package:clustranotes_mobile/features/upload/data/mapper/uploaded_note_dto_to_domain_note.mapper.ts.dart';
import 'package:clustranotes_mobile/features/upload/data/models/note_list_filter.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/note_status_stats.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_card.dart';
import 'package:clustranotes_mobile/features/upload/domain/repositories/upload_repository.dart';

class UploadRepositoryImpl implements UploadRepository {
  final UploadRemoteDataSource _uploadRemoteDataSource;

  UploadRepositoryImpl(this._uploadRemoteDataSource);

  @override
  Future<List<UploadedNoteCard>> getUserUploadedNotes({NoteListFilters? filter}) async {
    final getUploadedNotes = await _uploadRemoteDataSource.getUserUploadedNotes(filter: filter);
    return getUploadedNotes
        .map((dto) => UploadedNoteMapper.uploadedNoteCardMapper(dto))
        .toList();
  }
  
  @override
  Future<NoteStatusStats> getNoteStatusStats()async{
    final getUserNoteStatusStats = await _uploadRemoteDataSource.getNoteStatusStats();
    
    return NoteStatusStatsMapper.noteStatusStatsMapper(getUserNoteStatusStats);
  }
}
