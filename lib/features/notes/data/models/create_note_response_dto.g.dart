// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_note_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNoteResponseDto _$CreateNoteResponseDtoFromJson(
  Map<String, dynamic> json,
) => CreateNoteResponseDto(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  subject: json['subject'] as String,
  category: $enumDecode(_$NoteCategoryEnumMap, json['category']),
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  course: json['course'] as String,
  branch: json['branch'] as String?,
  college: json['college'] as String?,
  university: json['university'] as String?,
  semester: (json['semester'] as num?)?.toInt(),
  language: json['language'] as String,
  contentType: $enumDecode(_$NoteContentTypeEnumMap, json['contentType']),
  file: NoteFileDto.fromJson(json['file'] as Map<String, dynamic>),
  stats: CreateNoteResponseStatsDto.fromJson(
    json['stats'] as Map<String, dynamic>,
  ),
  uploader: NoteUploaderDto.fromJson(json['uploader'] as Map<String, dynamic>),
  isPublic: json['isPublic'] as bool,
  noteVerificationPublicStatus: $enumDecode(
    _$NoteVerificationPublicStatusEnumMap,
    json['noteVerificationPublicStatus'],
  ),
  notePublishStatus: $enumDecode(
    _$NotePublishStatusEnumMap,
    json['notePublishStatus'],
  ),
  publishedAt: json['publishedAt'] == null
      ? null
      : DateTime.parse(json['publishedAt'] as String),
  isLiked: json['isLiked'] as bool,
  isBookmarked: json['isBookmarked'] as bool,
  isOwner: json['isOwner'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$CreateNoteResponseDtoToJson(
  CreateNoteResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'subject': instance.subject,
  'category': _$NoteCategoryEnumMap[instance.category]!,
  'tags': instance.tags,
  'course': instance.course,
  'branch': instance.branch,
  'college': instance.college,
  'university': instance.university,
  'semester': instance.semester,
  'language': instance.language,
  'contentType': _$NoteContentTypeEnumMap[instance.contentType]!,
  'file': instance.file,
  'stats': instance.stats,
  'uploader': instance.uploader,
  'isPublic': instance.isPublic,
  'noteVerificationPublicStatus':
      _$NoteVerificationPublicStatusEnumMap[instance
          .noteVerificationPublicStatus]!,
  'notePublishStatus': _$NotePublishStatusEnumMap[instance.notePublishStatus]!,
  'publishedAt': instance.publishedAt?.toIso8601String(),
  'isLiked': instance.isLiked,
  'isBookmarked': instance.isBookmarked,
  'isOwner': instance.isOwner,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
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

const _$NoteContentTypeEnumMap = {
  NoteContentType.pdf: 'pdf',
  NoteContentType.docx: 'docx',
  NoteContentType.pptx: 'pptx',
  NoteContentType.ppt: 'ppt',
  NoteContentType.doc: 'doc',
};

const _$NoteVerificationPublicStatusEnumMap = {
  NoteVerificationPublicStatus.community: 'community',
  NoteVerificationPublicStatus.verified: 'verified',
};

const _$NotePublishStatusEnumMap = {
  NotePublishStatus.draft: 'draft',
  NotePublishStatus.published: 'published',
  NotePublishStatus.archived: 'archived',
  NotePublishStatus.removed: 'removed',
};
