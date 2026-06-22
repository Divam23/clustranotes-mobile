import 'package:clustranotes_mobile/features/comments/models/user_summary.dart';

final dummyUsers = [
  UserSummary(
    id: '1',
    firstName: 'Divam',
    lastName: 'Dubey',
    userName: 'divamdubey',
    isEmailVerified: true,
    avatarUrl: null,
    verificationStatus: VerificationStatus.verified,
  ),
  UserSummary(
    id: '2',
    firstName: 'Aryan',
    lastName: 'Arya',
    userName: 'aryaaryan',
    isEmailVerified: false,
    avatarUrl: null,
    verificationStatus: VerificationStatus.notVerified,
  ),
  UserSummary(
    id: '3',
    firstName: 'Anmol',
    lastName: 'Anshu',
    userName: 'anshuanmol',
    isEmailVerified: false,
    avatarUrl: null,
    verificationStatus: VerificationStatus.notVerified,
  ),
  UserSummary(
    id: '4',
    firstName: 'Aditya',
    lastName: 'Sushant',
    userName: 'adityasushant',
    isEmailVerified: true,
    avatarUrl: null,
    verificationStatus: VerificationStatus.verified,
  ),
  UserSummary(
    id: '5',
    firstName: 'Nishant',
    lastName: 'Kumar',
    userName: 'nishantkumar',
    isEmailVerified: true,
    avatarUrl: null,
    verificationStatus: VerificationStatus.verificationFailed,
  ),
  UserSummary(
    id: '6',
    firstName: 'Harsh',
    lastName: 'Raj',
    userName: 'harshraj',
    isEmailVerified: true,
    avatarUrl: null,
    verificationStatus: VerificationStatus.underVerification,
  ),
  UserSummary(
    id: '7',
    firstName: 'Akansh',
    lastName: 'Kumar',
    userName: 'akanshkumar',
    isEmailVerified: true,
    avatarUrl: null,
    verificationStatus: VerificationStatus.verified,
  ),
  UserSummary(
    id: '8',
    firstName: 'Rahul',
    lastName: 'Kumar',
    userName: 'kumarrahul',
    isEmailVerified: false,
    avatarUrl: null,
    verificationStatus: VerificationStatus.notVerified,
  ),
  
];

const divam = UserSummary(
  id: 'u2',
  firstName: 'Divam',
  lastName: 'Dubey',
  userName: 'divam',
  avatarUrl: null,
  isEmailVerified: true,
  verificationStatus: VerificationStatus.verified,
);

const harsh = UserSummary(
  id: 'u3',
  firstName: 'Harsh',
  lastName: 'Singh',
  userName: 'harsh',
  avatarUrl: null,
  isEmailVerified: true,
  verificationStatus: VerificationStatus.notVerified,
);
