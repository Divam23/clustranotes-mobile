import 'package:json_annotation/json_annotation.dart';
part 'api_response_dto.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponseDto<T> {
  final int statusCode;
  final bool success;
  final T? data;
  final String message;

  const ApiResponseDto({
    required this.success,
    required this.statusCode,
    required this.data,
    required this.message,
  });

  factory ApiResponseDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ApiResponseDtoFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ApiResponseDtoToJson(this, toJsonT);
}
