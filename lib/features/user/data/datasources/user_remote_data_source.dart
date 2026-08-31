import 'package:clustranotes_mobile/core/api/client/api_client.dart';
import 'package:clustranotes_mobile/core/api/models/api_response_dto.dart';
import 'package:clustranotes_mobile/features/user/data/constants/user_api_endpoints.dart';
import 'package:clustranotes_mobile/features/user/data/models/user_response_dto.dart';

class UserRemoteDataSource {
  final ApiClient _apiClient;
  
  UserRemoteDataSource(this._apiClient);
  
  Future<UserResponseDto> authenticateUser() async{
    final response = await _apiClient.post(
      path: UserApiEndpoints.authenticate,
    );
    
    final apiResponse = ApiResponseDto<UserResponseDto>.fromJson(
      response.data as Map<String, dynamic>,
        (json) => UserResponseDto.fromJson(
          json as Map<String, dynamic>
        )
    );
    
    if(!apiResponse.success || apiResponse.data == null){
      throw Exception(apiResponse.message);
    }
    
    return apiResponse.data!;
  }

  Future<UserResponseDto> getCurrentUser() async {
    final response = await _apiClient.get(
        path: UserApiEndpoints.currentUser
    );

    final apiResponse = ApiResponseDto<UserResponseDto>.fromJson(
        response.data as Map<String, dynamic>,
            (json) => UserResponseDto.fromJson(
            json as Map<String, dynamic>
        )
    );

    if(!apiResponse.success || apiResponse.data == null){
      throw Exception(apiResponse.message);
    }

    return apiResponse.data!;
  }
}


