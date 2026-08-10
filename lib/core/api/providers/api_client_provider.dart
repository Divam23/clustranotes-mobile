import 'package:clustranotes_mobile/core/api/client/api_client.dart';
import 'package:clustranotes_mobile/core/api/providers/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiClientProvider = Provider<ApiClient>((ref){
  final dio = ref.read(dioProvider);
  
  return ApiClient(dio);
});
