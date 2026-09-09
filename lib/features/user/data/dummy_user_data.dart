import 'package:clustranotes_mobile/features/user/domain/enums/user_enums.dart';
import 'package:clustranotes_mobile/features/user/domain/models/user_avatar.dart';
import 'package:clustranotes_mobile/features/user/domain/models/user_summary.dart';

final dummyUsers = [
  UserSummary(
    id: '1',
    firstName: 'Divam',
    lastName: 'Dubey',
    userName: 'divamdubey',
    avatar: UserAvatarModel(url: '', storagePath: ''),
    userVerificationStatus: UserVerificationStatus.verified,
  ),
  UserSummary(
    id: '2',
    firstName: 'Aryan',
    lastName: 'Arya',
    userName: 'aryaaryan',
    avatar: UserAvatarModel(url: '', storagePath: ''),
    userVerificationStatus: UserVerificationStatus.notVerified,
  ),
  UserSummary(
    id: '3',
    firstName: 'Anmol',
    lastName: 'Anshu',
    userName: 'anshuanmol',
    avatar: UserAvatarModel(url: '', storagePath: ''),
    userVerificationStatus: UserVerificationStatus.notVerified,
  ),
  UserSummary(
    id: '4',
    firstName: 'Aditya',
    lastName: 'Sushant',
    userName: 'adityasushant',
    avatar: UserAvatarModel(url: '', storagePath: ''),
    userVerificationStatus: UserVerificationStatus.verified,
  ),
  UserSummary(
    id: '5',
    firstName: 'Nishant',
    lastName: 'Kumar',
    userName: 'nishantkumar',
    avatar: UserAvatarModel(url: '', storagePath: ''),
    userVerificationStatus: UserVerificationStatus.verificationFailed,
  ),
  UserSummary(
    id: '6',
    firstName: 'Harsh',
    lastName: 'Raj',
    userName: 'harshraj',
    avatar: UserAvatarModel(url: '', storagePath: ''),
    userVerificationStatus: UserVerificationStatus.underVerification,
  ),
  UserSummary(
    id: '7',
    firstName: 'Akansh',
    lastName: 'Kumar',
    userName: 'akanshkumar',
    avatar: UserAvatarModel(url: '', storagePath: ''),
    userVerificationStatus: UserVerificationStatus.verified,
  ),
  UserSummary(
    id: '8',
    firstName: 'Rahul',
    lastName: 'Kumar',
    userName: 'kumarrahul',
    avatar: UserAvatarModel(url: '', storagePath: ''),
    userVerificationStatus: UserVerificationStatus.notVerified,
  ),
  
];

const divam = UserSummary(
  id: 'u2',
  firstName: 'Divam',
  lastName: 'Dubey',
  userName: 'divam',
  avatar: UserAvatarModel(url: '', storagePath: ''),
  userVerificationStatus: UserVerificationStatus.verified,
);

const harsh = UserSummary(
  id: 'u3',
  firstName: 'Harsh',
  lastName: 'Singh',
  userName: 'harsh',
  avatar: UserAvatarModel(url: '', storagePath: ''),
  userVerificationStatus: UserVerificationStatus.notVerified,
);
