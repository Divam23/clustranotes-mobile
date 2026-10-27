import 'package:json_annotation/json_annotation.dart';
part 'uploaded_note_file_dto.g.dart';

@JsonSerializable()
class UploadedNoteFileDto {
  final bool canDownload;
  final int? pageCount;
  final String? thumbnailUrl;
  
  const UploadedNoteFileDto({
    required this.canDownload,
    this.thumbnailUrl,
    this.pageCount,
  });
  
  factory UploadedNoteFileDto.fromJson(Map<String, dynamic> json) => _$UploadedNoteFileDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UploadedNoteFileDtoToJson(this);
}
