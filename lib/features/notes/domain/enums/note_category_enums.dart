import 'package:json_annotation/json_annotation.dart';

enum NoteCategoryEnum {
  @JsonValue('lecture_notes')
  lectureNotes,

  @JsonValue('handwritten')
  handwritten,

  @JsonValue('previous_year_questions')
  previousYearQuestions,

  @JsonValue('revision_notes')
  revisionNotes,

  @JsonValue('assignment')
  assignment,

  @JsonValue('lab_manual')
  labManual,

  @JsonValue('lab_record')
  labRecord,

  @JsonValue('summary')
  summary,

  @JsonValue('cheat_sheet')
  cheatSheet,

  @JsonValue('presentation')
  presentation,

  @JsonValue('ebook')
  ebook,

  @JsonValue('syllabus')
  syllabus,

  @JsonValue('question_bank')
  questionBank,

  @JsonValue('practice_set')
  practiceSet,

  @JsonValue('project_report')
  projectReport,

  @JsonValue('others')
  others,
}
