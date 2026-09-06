import 'package:json_annotation/json_annotation.dart';
part 'note_file_dto.g.dart';

@JsonSerializable()
class NoteFileDto {
  final int size;
  final String mimeType;
  final int pageCount;
  final bool canDownload;
  final int readingTime;
  final String thumbnailUrl;
  
  const NoteFileDto({
    required this.size,
    required this.mimeType,
    required this.pageCount,
    required this.thumbnailUrl,
    required this.canDownload,
    required this.readingTime
  });
  
  factory NoteFileDto.fromJson(Map<String, dynamic> json) => _$NoteFileDtoFromJson(json);
  
  Map<String, dynamic> toJson() => _$NoteFileDtoToJson(this);
}
