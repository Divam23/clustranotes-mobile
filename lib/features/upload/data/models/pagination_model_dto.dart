import 'package:json_annotation/json_annotation.dart';
part 'pagination_model_dto.g.dart';

@JsonSerializable()
class PaginationModelDto {
  final int page;
  final int limit;
  final int totalResults;
  final int totalPages;
  const PaginationModelDto({
    this.page = 1,
    this.limit = 15,
    required this.totalPages,
    required this.totalResults,
  });

  factory PaginationModelDto.fromJson(Map<String, dynamic> json) => _$PaginationModelDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationModelDtoToJson(this);
}

