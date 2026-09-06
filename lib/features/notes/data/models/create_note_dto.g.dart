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
      category: $enumDecode(_$NoteCategoryEnumMap, json['category']),
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
      'category': _$NoteCategoryEnumMap[instance.category]!,
      'tags': instance.tags,
      'semester': instance.semester,
      'course': instance.course,
      'university': instance.university,
      'language': instance.language,
      'isPublic': instance.isPublic,
      'canDownload': instance.canDownload,
    };

const _$NoteCategoryEnumMap = {
  NoteCategory.lectureNotes: 'lectureNotes',
  NoteCategory.handwritten: 'handwritten',
  NoteCategory.previousYearQuestions: 'previousYearQuestions',
  NoteCategory.revisionNotes: 'revisionNotes',
  NoteCategory.assignment: 'assignment',
  NoteCategory.labManual: 'labManual',
  NoteCategory.labRecord: 'labRecord',
  NoteCategory.summary: 'summary',
  NoteCategory.cheatSheet: 'cheatSheet',
  NoteCategory.presentation: 'presentation',
  NoteCategory.ebook: 'ebook',
  NoteCategory.syllabus: 'syllabus',
  NoteCategory.questionBank: 'questionBank',
  NoteCategory.practiceSet: 'practiceSet',
  NoteCategory.projectReport: 'projectReport',
  NoteCategory.others: 'others',
};
