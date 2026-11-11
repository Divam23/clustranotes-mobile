import 'package:clustranotes_mobile/features/upload/data/models/pagination_model_dto.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/pagination_info.dart';

class PaginationModelDtoToPaginationInfoMapper {
  const PaginationModelDtoToPaginationInfoMapper._();

  static PaginationInfo paginationInfoMapper(PaginationModelDto dto) {
    return PaginationInfo(
      totalResults: dto.totalResults,
      totalPages: dto.totalPages,
      limit: dto.limit,
      page: dto.page
    );
  }
}
