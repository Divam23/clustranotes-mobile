import 'package:json_annotation/json_annotation.dart';

enum UserTheme {
  @JsonValue('light')
  light,
  @JsonValue('dark')
  dark,
  @JsonValue('system')
  system,
  
}
