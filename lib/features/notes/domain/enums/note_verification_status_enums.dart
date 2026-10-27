import 'package:clustranotes_mobile/features/notes/domain/enums/note_publish_status_enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note_verification_status_enums.g.dart';

@JsonEnum(alwaysCreate: true)
enum NoteVerificationPublicStatus {
  @JsonValue('community')
  community,

  @JsonValue('verified')
  verified,
}

@JsonEnum(
  fieldRename: FieldRename.snake,
  alwaysCreate: true,
)
enum NoteVerificationPrivateStatus {
  unverified,
  pendingReview,
  verified,
  rejected,
}

@JsonSerializable()
class NoteVerificationStatus {
@JsonKey(
  unknownEnumValue: NotePublishStatus.published,
  defaultValue: NotePublishStatus.published,
)
final NotePublishStatus publishStatus;

@JsonKey(
  unknownEnumValue: NoteVerificationPublicStatus.community,
  defaultValue: NoteVerificationPublicStatus.community,
)
final NoteVerificationPublicStatus publicStatus;

@JsonKey(
  unknownEnumValue: NoteVerificationPrivateStatus.unverified,
  defaultValue: NoteVerificationPrivateStatus.unverified,
)
final NoteVerificationPrivateStatus privateStatus;

const NoteVerificationStatus({
  this.publishStatus = NotePublishStatus.published,
  this.privateStatus = NoteVerificationPrivateStatus.unverified,
  this.publicStatus = NoteVerificationPublicStatus.community
});

factory NoteVerificationStatus.fromJson(dynamic json) {
  if(json is String){
    final status = _parsePrivateStatus(json);
    return NoteVerificationStatus(
      privateStatus: status,
      publicStatus: status == NoteVerificationPrivateStatus.verified ? NoteVerificationPublicStatus.verified : NoteVerificationPublicStatus.community
    );
  }
  if(json is Map<String, dynamic>){
    return _$NoteVerificationStatusFromJson(json);
  }
  return const NoteVerificationStatus();
}

static NoteVerificationPrivateStatus _parsePrivateStatus(String value) {
  switch (value) {
    case 'verified':
      return NoteVerificationPrivateStatus.verified;
    case 'pending_review':
    case 'pendingReview':
      return NoteVerificationPrivateStatus.pendingReview;
    case 'rejected':
      return NoteVerificationPrivateStatus.rejected;
    case 'unverified':
    default:
      return NoteVerificationPrivateStatus.unverified;
  }
}

Map<String, dynamic> toJson() => _$NoteVerificationStatusToJson(this);

bool get isVerified =>
    publicStatus == NoteVerificationPublicStatus.verified &&
        privateStatus == NoteVerificationPrivateStatus.verified;

bool get isPending =>
    privateStatus == NoteVerificationPrivateStatus.pendingReview;

bool get isRejected =>
    privateStatus == NoteVerificationPrivateStatus.rejected;
}
