import 'package:freezed_annotation/freezed_annotation.dart';

enum UserRole{
  @JsonValue('student')
  student,
  @JsonValue('teacher')
  teacher,
  @JsonValue('lecturer')
  lecturer,
  @JsonValue('teachingAssistant')
  teachingAssistant,
  @JsonValue('postgraduateStudent')
  postgraduateStudent,
  @JsonValue('alumni')
  alumni,
  @JsonValue('guest')
  guest
}

