class UserSummary{
  final String id;
  final String firstName;
  final String lastName;
  final String userName;
  final String? avatarUrl;
  final bool isEmailVerified;
  final VerificationStatus verificationStatus;
  
  const UserSummary({
   required this.id,
   required this.firstName,
   required this.lastName,
    required this.userName,
   this.avatarUrl,
   required this.isEmailVerified,
   required this.verificationStatus 
  });
  
  bool get isIdentityVerified => verificationStatus == VerificationStatus.verified;
}

enum VerificationStatus{
  notVerified,
  verified,
  underVerification,
  verificationFailed
}
