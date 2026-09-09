import 'package:clustranotes_mobile/features/notes/domain/enums/note_category_enums.dart';
import 'package:json_annotation/json_annotation.dart';
part 'create_note_dto.g.dart';

@JsonSerializable()
class CreateNoteDto {
  final String title;
  final String description;
  final String subject;
  final String? branch;
  final NoteCategoryEnum category;
  final List<String>? tags;
  final int? semester;
  final String course;
  final String? collegeName;
  final String? university;
  final String? language;
  final bool isPublic;
  final bool canDownload;

  const CreateNoteDto({
    required this.title,
    required this.description,
    required this.subject,
    required this.category,
    this.collegeName,
    this.branch,
    this.tags,
    this.semester,
    required this.course,
    this.university,
    this.language = 'en',
    this.isPublic = true,
    this.canDownload = true,
  });

  factory CreateNoteDto.fromJson(Map<String, dynamic> json) => _$CreateNoteDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateNoteDtoToJson(this);
}
