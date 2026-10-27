import 'package:clustranotes_mobile/core/api/client/api_client.dart';
import 'package:clustranotes_mobile/features/upload/data/constants/upload_api_endpoints.dart';
import 'package:clustranotes_mobile/features/upload/data/models/note_list_filter.dart';
import 'package:clustranotes_mobile/features/upload/data/models/note_status_stats_dto.dart';
import 'package:clustranotes_mobile/features/upload/data/models/uploaded_note_card_dto.dart';

class UploadRemoteDataSource {
  final ApiClient _apiClient;
  UploadRemoteDataSource(this._apiClient);
  
  Future<List<UploadedNoteCardDto>> getUserUploadedNotes({NoteListFilters? filter}) async{
    final queryParameters = <String, dynamic>{
      if (filter?.notePublishStatus != null)
        'notePublishStatus': filter?.notePublishStatus,
      if (filter?.noteVerificationStatus != null)
        'noteVerificationStatus': filter?.noteVerificationStatus,
      if (filter?.page != null)
        'page': filter?.page,
      if (filter?.limit != null)
        'limit': filter?.limit,
    };
    
    final response = await _apiClient.get<Map<String, dynamic>>(
        queryParameters: queryParameters,
        path: UploadApiEndpoints.myUploads
    );
    final responseData = response.data?['data'] as Map<String, dynamic>?;
    final pagination = responseData?['pagination'] as Map<String, int>?;
    final notesList = responseData?['notes'] as List<dynamic>? ?? [];
    return notesList
        .map((item) => UploadedNoteCardDto.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  Future<NoteStatusStatsDto> getNoteStatusStats()async{
    final response = await _apiClient.get<Map<String, dynamic>>(path: UploadApiEndpoints.getNoteStatusStats);
    final responseData = response.data?['data'];
    
    return NoteStatusStatsDto.fromJson(responseData as Map<String, dynamic>);
  }
}
