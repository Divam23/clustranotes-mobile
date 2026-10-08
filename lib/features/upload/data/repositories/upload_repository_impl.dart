import 'package:clustranotes_mobile/features/upload/data/datasource/upload_remote_datasource.dart';
import 'package:clustranotes_mobile/features/upload/data/mapper/uploaded_note_dto_to_domain_note.mapper.ts.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_card.dart';
import 'package:clustranotes_mobile/features/upload/domain/repositories/upload_repository.dart';

class UploadRepositoryImpl implements UploadRepository{
  final UploadRemoteDataSource _uploadRemoteDataSource;
  
  UploadRepositoryImpl(this._uploadRemoteDataSource);
  
  @override
  Future<UploadedNoteCard> getUserUploadedNotes({
    required String userId,
  })async{
    final getUploadedNotes = await _uploadRemoteDataSource.getUserUploadedNotes(userId: userId);
    return UploadedNoteMapper.uploadedNoteCardMapper(getUploadedNotes);
}

}
