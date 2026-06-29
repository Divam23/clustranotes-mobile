enum UserVerificationStatus{
  notVerified,
  verified,
  underVerification,
  verificationFailed
}

extension UserVerificationStatusJson on UserVerificationStatus {
  static UserVerificationStatus fromJson(String value) {
    switch (value) {
      case 'not_verified':
        return UserVerificationStatus.notVerified;
      case 'under_verification':
        return UserVerificationStatus.underVerification;
      case 'verified':
        return UserVerificationStatus.verified;
      case 'verification_failed':
        return UserVerificationStatus.verificationFailed;
      default:
        return UserVerificationStatus.notVerified;
    }
  }

  String toJson() {
    switch (this) {
      case UserVerificationStatus.notVerified:
        return 'not_verified';
      case UserVerificationStatus.underVerification:
        return 'under_verification';
      case UserVerificationStatus.verified:
        return 'verified';
      case UserVerificationStatus.verificationFailed:
        return 'verification_failed';
    }
  }
}

