// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationModelDto _$PaginationModelDtoFromJson(Map<String, dynamic> json) =>
    PaginationModelDto(
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 15,
      totalPages: (json['totalPages'] as num).toInt(),
      totalResults: (json['totalResults'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationModelDtoToJson(PaginationModelDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'totalResults': instance.totalResults,
      'totalPages': instance.totalPages,
    };
