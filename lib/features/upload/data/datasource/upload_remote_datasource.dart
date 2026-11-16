import 'package:clustranotes_mobile/core/api/client/api_client.dart';
import 'package:clustranotes_mobile/features/upload/data/constants/upload_api_endpoints.dart';
import 'package:clustranotes_mobile/features/upload/data/models/note_list_filter.dart';
import 'package:clustranotes_mobile/features/upload/data/models/note_status_stats_dto.dart';
import 'package:clustranotes_mobile/features/upload/data/models/pagination_model_dto.dart';
import 'package:clustranotes_mobile/features/upload/data/models/uploaded_note_card_dto.dart';
import 'package:clustranotes_mobile/features/upload/data/models/uploaded_notes_list_response_dto.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/pagination_params.dart';
import 'package:dio/dio.dart';

class UploadRemoteDataSource {
  final ApiClient _apiClient;
  UploadRemoteDataSource(this._apiClient);

  Future<UploadedNotesListResponseDto> getUserUploadedNotes({
    NoteListFilters? filter,
    required PaginationParams pagination,
    CancelToken? cancelToken
  }) 
  async {
    final queryParameters = <String, dynamic>{
      if (filter?.notePublishStatus != null)
        'notePublishStatus': filter?.notePublishStatus,
      if (filter?.noteVerificationStatus != null)
        'noteVerificationStatus': filter?.noteVerificationStatus,
      'page': pagination.page,
      'limit': pagination.limit,
    };

    final response = await _apiClient.get<Map<String, dynamic>>(
      queryParameters: queryParameters,
      path: UploadApiEndpoints.myUploads,
      cancelToken: cancelToken
    );
    final responseData = response.data?['data'] as Map<String, dynamic>?;
    final paginationData = responseData?['pagination'] as Map<String, dynamic>;
    final notesList = responseData?['notes'] as List<dynamic>? ?? [];
    return UploadedNotesListResponseDto(
      notes: notesList
          .map(
            (item) =>
                UploadedNoteCardDto.fromJson(item as Map<String, dynamic>),
          )
          .toList(),
      pagination: PaginationModelDto.fromJson(paginationData),
    );
  }

  Future<NoteStatusStatsDto> getNoteStatusStats() async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      path: UploadApiEndpoints.getNoteStatusStats,
    );
    final responseData = response.data?['data'];

    return NoteStatusStatsDto.fromJson(responseData as Map<String, dynamic>);
  }
}
