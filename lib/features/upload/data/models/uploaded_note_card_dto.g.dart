// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_note_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadedNoteCardDto _$UploadedNoteCardDtoFromJson(
  Map<String, dynamic> json,
) => UploadedNoteCardDto(
  id: json['id'] as String,
  title: json['title'] as String,
  subject: json['subject'] as String,
  category: $enumDecode(_$NoteCategoryEnumEnumMap, json['category']),
  isPublic: json['isPublic'] as bool,
  noteContentType: $enumDecode(
    _$NoteContentTypeEnumMap,
    json['noteContentType'],
  ),
  file: UploadedNoteFileDto.fromJson(json['file'] as Map<String, dynamic>),
  stats: UploadedNoteStatsDto.fromJson(json['stats'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  notePublishStatus: $enumDecode(
    _$NotePublishStatusEnumMap,
    json['notePublishStatus'],
  ),
  noteVerificationStatus: NoteVerificationStatus.fromJson(
    json['noteVerificationStatus'] as Map<String, dynamic>,
  ),
  publishedAt: DateTime.parse(json['publishedAt'] as String),
  submittedForReviewAt: DateTime.parse(json['submittedForReviewAt'] as String),
  approvedAt: DateTime.parse(json['approvedAt'] as String),
  rejectedAt: DateTime.parse(json['rejectedAt'] as String),
  rejectionReason: json['rejectionReason'] as String,
);

Map<String, dynamic> _$UploadedNoteCardDtoToJson(
  UploadedNoteCardDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'subject': instance.subject,
  'category': _$NoteCategoryEnumEnumMap[instance.category]!,
  'isPublic': instance.isPublic,
  'noteContentType': _$NoteContentTypeEnumMap[instance.noteContentType]!,
  'file': instance.file,
  'stats': instance.stats,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'notePublishStatus': _$NotePublishStatusEnumMap[instance.notePublishStatus]!,
  'noteVerificationStatus': instance.noteVerificationStatus,
  'publishedAt': instance.publishedAt.toIso8601String(),
  'submittedForReviewAt': instance.submittedForReviewAt.toIso8601String(),
  'approvedAt': instance.approvedAt.toIso8601String(),
  'rejectedAt': instance.rejectedAt.toIso8601String(),
  'rejectionReason': instance.rejectionReason,
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

const _$NoteContentTypeEnumMap = {
  NoteContentType.pdf: 'pdf',
  NoteContentType.docx: 'docx',
  NoteContentType.pptx: 'pptx',
  NoteContentType.ppt: 'ppt',
  NoteContentType.doc: 'doc',
};

const _$NotePublishStatusEnumMap = {
  NotePublishStatus.draft: 'draft',
  NotePublishStatus.published: 'published',
  NotePublishStatus.archived: 'archived',
  NotePublishStatus.removed: 'removed',
};
