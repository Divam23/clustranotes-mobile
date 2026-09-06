import 'package:clustranotes_mobile/features/user/domain/enums/user_enums.dart';
import 'package:clustranotes_mobile/features/user/domain/models/user_avatar.dart';

class UserSummary{
  final String id;
  final String firstName;
  final String lastName;
  final String userName;
  final UserAvatarModel? avatar;
  final UserVerificationStatus userVerificationStatus;
  
  const UserSummary({
   required this.id,
   required this.firstName,
   required this.lastName,
   required this.userName,
   this.avatar,
   required this.userVerificationStatus 
  });
  
  bool get isIdentityVerified => userVerificationStatus == UserVerificationStatus.verified;
}
