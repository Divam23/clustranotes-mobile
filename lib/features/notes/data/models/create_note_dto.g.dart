// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_note_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNoteDto _$CreateNoteDtoFromJson(Map<String, dynamic> json) =>
    CreateNoteDto(
      title: json['title'] as String,
      description: json['description'] as String,
      subject: json['subject'] as String,
      category: $enumDecode(_$NoteCategoryEnumEnumMap, json['category']),
      collegeName: json['collegeName'] as String?,
      branch: json['branch'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      semester: (json['semester'] as num?)?.toInt(),
      course: json['course'] as String,
      university: json['university'] as String?,
      language: json['language'] as String? ?? 'en',
      isPublic: json['isPublic'] as bool? ?? true,
      canDownload: json['canDownload'] as bool? ?? true,
    );

Map<String, dynamic> _$CreateNoteDtoToJson(CreateNoteDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'subject': instance.subject,
      'branch': instance.branch,
      'category': _$NoteCategoryEnumEnumMap[instance.category]!,
      'tags': instance.tags,
      'semester': instance.semester,
      'course': instance.course,
      'collegeName': instance.collegeName,
      'university': instance.university,
      'language': instance.language,
      'isPublic': instance.isPublic,
      'canDownload': instance.canDownload,
    };

const _$NoteCategoryEnumEnumMap = {
  NoteCategoryEnum.lectureNotes: 'lecture_notes',
  NoteCategoryEnum.handwritten: 'handwritten',
  NoteCategoryEnum.previousYearQuestions: 'previous_year_questions',
  NoteCategoryEnum.revisionNotes: 'revision_notes',
  NoteCategoryEnum.assignment: 'assignment',
  NoteCategoryEnum.labManual: 'lab_manual',
  NoteCategoryEnum.labRecord: 'lab_record',
  NoteCategoryEnum.summary: 'summary',
  NoteCategoryEnum.cheatSheet: 'cheat_sheet',
  NoteCategoryEnum.presentation: 'presentation',
  NoteCategoryEnum.ebook: 'ebook',
  NoteCategoryEnum.syllabus: 'syllabus',
  NoteCategoryEnum.questionBank: 'question_bank',
  NoteCategoryEnum.practiceSet: 'practice_set',
  NoteCategoryEnum.projectReport: 'project_report',
  NoteCategoryEnum.others: 'others',
};
