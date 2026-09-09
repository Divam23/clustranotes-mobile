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

factory NoteVerificationStatus.fromJson(Map<String, dynamic> json) =>
    _$NoteVerificationStatusFromJson(json);

Map<String, dynamic> toJson() => _$NoteVerificationStatusToJson(this);

bool get isVerified =>
    publicStatus == NoteVerificationPublicStatus.verified &&
        privateStatus == NoteVerificationPrivateStatus.verified;

bool get isPending =>
    privateStatus == NoteVerificationPrivateStatus.pendingReview;

bool get isRejected =>
    privateStatus == NoteVerificationPrivateStatus.rejected;
}
