import 'package:json_annotation/json_annotation.dart';
part 'create_note_response_dto.g.dart';

@JsonSerializable()
class CreateNoteResponseDto {
  final String id;
  final String title;
  final String subject;
  final String course;
  final bool isPublic;
  final int fileSize;
  final DateTime? publishedAt;

  const CreateNoteResponseDto({
    required this.id,
    required this.title,
    required this.subject,
    required this.course,
    required this.fileSize,
    required this.isPublic,
    this.publishedAt,
  });
  
  factory CreateNoteResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CreateNoteResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateNoteResponseDtoToJson(this);
}
