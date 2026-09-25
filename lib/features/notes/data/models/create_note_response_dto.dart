import 'package:clustranotes_mobile/core/api/models/note_content_type_enum.dart';
import 'package:clustranotes_mobile/features/notes/data/models/create_note_response_stats_dto.dart';
import 'package:clustranotes_mobile/features/notes/data/models/note_file_dto.dart';
import 'package:clustranotes_mobile/features/notes/data/models/note_uploader_dto.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_category_enums.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_publish_status_enums.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_verification_status_enums.dart';
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
