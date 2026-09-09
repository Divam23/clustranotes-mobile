import 'package:json_annotation/json_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum NotePublishStatus {
  @JsonValue('draft')
  draft,

  @JsonValue('published')
  published,

  @JsonValue('archived')
  archived,

  @JsonValue('removed')
  removed,
}
