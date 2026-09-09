// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_verification_status_enums.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteVerificationStatus _$NoteVerificationStatusFromJson(
  Map<String, dynamic> json,
) => NoteVerificationStatus(
  publishStatus:
      $enumDecodeNullable(
        _$NotePublishStatusEnumMap,
        json['publishStatus'],
        unknownValue: NotePublishStatus.published,
      ) ??
      NotePublishStatus.published,
  privateStatus:
      $enumDecodeNullable(
        _$NoteVerificationPrivateStatusEnumMap,
        json['privateStatus'],
        unknownValue: NoteVerificationPrivateStatus.unverified,
      ) ??
      NoteVerificationPrivateStatus.unverified,
  publicStatus:
      $enumDecodeNullable(
        _$NoteVerificationPublicStatusEnumMap,
        json['publicStatus'],
        unknownValue: NoteVerificationPublicStatus.community,
      ) ??
      NoteVerificationPublicStatus.community,
);

Map<String, dynamic> _$NoteVerificationStatusToJson(
  NoteVerificationStatus instance,
) => <String, dynamic>{
  'publishStatus': _$NotePublishStatusEnumMap[instance.publishStatus]!,
  'publicStatus': _$NoteVerificationPublicStatusEnumMap[instance.publicStatus]!,
  'privateStatus':
      _$NoteVerificationPrivateStatusEnumMap[instance.privateStatus]!,
};

const _$NotePublishStatusEnumMap = {
  NotePublishStatus.draft: 'draft',
  NotePublishStatus.published: 'published',
  NotePublishStatus.archived: 'archived',
  NotePublishStatus.removed: 'removed',
};

const _$NoteVerificationPrivateStatusEnumMap = {
  NoteVerificationPrivateStatus.unverified: 'unverified',
  NoteVerificationPrivateStatus.pendingReview: 'pending_review',
  NoteVerificationPrivateStatus.verified: 'verified',
  NoteVerificationPrivateStatus.rejected: 'rejected',
};

const _$NoteVerificationPublicStatusEnumMap = {
  NoteVerificationPublicStatus.community: 'community',
  NoteVerificationPublicStatus.verified: 'verified',
};
