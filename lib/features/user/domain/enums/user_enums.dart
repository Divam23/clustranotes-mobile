import 'package:json_annotation/json_annotation.dart';

enum UserVerificationStatus{
  @JsonValue('not_verified')
  notVerified,

  @JsonValue('verified')
  verified,

  @JsonValue('under_verification')
  underVerification,

  @JsonValue('verification_failed')
  verificationFailed,

}


