import 'package:clustranotes_mobile/core/api/client/api_client.dart';
import 'package:clustranotes_mobile/features/upload/data/constants/upload_api_endpoints.dart';
import 'package:clustranotes_mobile/features/upload/data/models/uploaded_note_card_dto.dart';

class UploadRemoteDataSource {
  final ApiClient _apiClient;
  UploadRemoteDataSource(this._apiClient);
  
  Future<UploadedNoteCardDto> getUserUploadedNotes({
    required String userId,
  })async{
    final response = await _apiClient.get<Map<String, dynamic>>(path: UploadApiEndpoints.myUploads);
    final responseData = response.data?['data'];
    
    return UploadedNoteCardDto.fromJson(
      responseData as Map<String, dynamic>
    );
  }
}
