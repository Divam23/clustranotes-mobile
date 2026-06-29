import 'package:clustranotes_mobile/features/user/models/user_enums.dart';
import 'package:clustranotes_mobile/features/user/models/user_summary.dart';

final dummyUsers = [
  UserSummary(
    id: '1',
    firstName: 'Divam',
    lastName: 'Dubey',
    userName: 'divamdubey',
    isEmailVerified: true,
    avatarUrl: null,
    userVerificationStatus: UserVerificationStatus.verified,
  ),
  UserSummary(
    id: '2',
    firstName: 'Aryan',
    lastName: 'Arya',
    userName: 'aryaaryan',
    isEmailVerified: false,
    avatarUrl: null,
    userVerificationStatus: UserVerificationStatus.notVerified,
  ),
  UserSummary(
    id: '3',
    firstName: 'Anmol',
    lastName: 'Anshu',
    userName: 'anshuanmol',
    isEmailVerified: false,
    avatarUrl: null,
    userVerificationStatus: UserVerificationStatus.notVerified,
  ),
  UserSummary(
    id: '4',
    firstName: 'Aditya',
    lastName: 'Sushant',
    userName: 'adityasushant',
    isEmailVerified: true,
    avatarUrl: null,
    userVerificationStatus: UserVerificationStatus.verified,
  ),
  UserSummary(
    id: '5',
    firstName: 'Nishant',
    lastName: 'Kumar',
    userName: 'nishantkumar',
    isEmailVerified: true,
    avatarUrl: null,
    userVerificationStatus: UserVerificationStatus.verificationFailed,
  ),
  UserSummary(
    id: '6',
    firstName: 'Harsh',
    lastName: 'Raj',
    userName: 'harshraj',
    isEmailVerified: true,
    avatarUrl: null,
    userVerificationStatus: UserVerificationStatus.underVerification,
  ),
  UserSummary(
    id: '7',
    firstName: 'Akansh',
    lastName: 'Kumar',
    userName: 'akanshkumar',
    isEmailVerified: true,
    avatarUrl: null,
    userVerificationStatus: UserVerificationStatus.verified,
  ),
  UserSummary(
    id: '8',
    firstName: 'Rahul',
    lastName: 'Kumar',
    userName: 'kumarrahul',
    isEmailVerified: false,
    avatarUrl: null,
    userVerificationStatus: UserVerificationStatus.notVerified,
  ),
  
];

const divam = UserSummary(
  id: 'u2',
  firstName: 'Divam',
  lastName: 'Dubey',
  userName: 'divam',
  avatarUrl: null,
  isEmailVerified: true,
  userVerificationStatus: UserVerificationStatus.verified,
);

const harsh = UserSummary(
  id: 'u3',
  firstName: 'Harsh',
  lastName: 'Singh',
  userName: 'harsh',
  avatarUrl: null,
  isEmailVerified: true,
  userVerificationStatus: UserVerificationStatus.notVerified,
);
