import 'package:clustranotes_mobile/features/user/models/user_enums.dart';

class UserSummary{
  final String id;
  final String firstName;
  final String lastName;
  final String userName;
  final String? avatarUrl;
  final bool isEmailVerified;
  final UserVerificationStatus userVerificationStatus;
  
  const UserSummary({
   required this.id,
   required this.firstName,
   required this.lastName,
   required this.userName,
   this.avatarUrl,
   required this.isEmailVerified,
   required this.userVerificationStatus 
  });
  
  bool get isIdentityVerified => userVerificationStatus == UserVerificationStatus.verified;
}
