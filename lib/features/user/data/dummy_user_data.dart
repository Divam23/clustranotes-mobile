import 'package:clustranotes_mobile/features/user/domain/enums/user_enums.dart';
import 'package:clustranotes_mobile/features/user/domain/models/user_avatar.dart';
import 'package:clustranotes_mobile/features/user/domain/models/user_summary.dart';

final List<UserSummary> dummyUsers = [
  UserSummary(
    id: 'u1001',
    firstName: 'Ananya',
    lastName: 'Sharma',
    userName: 'ananya_sharma',
    avatar: const UserAvatarModel(
      url: 'https://i.pravatar.cc/150?img=1',
      storagePath: 'avatars/u1001.jpg',
    ),
    userVerificationStatus: UserVerificationStatus.verified,
  ),
  UserSummary(
    id: 'u1002',
    firstName: 'Rohan',
    lastName: 'Mehta',
    userName: 'rohan.mehta',
    avatar: const UserAvatarModel(
      url: 'https://i.pravatar.cc/150?img=2',
      storagePath: 'avatars/u1002.jpg',
    ),
    userVerificationStatus: UserVerificationStatus.notVerified,
  ),
  UserSummary(
    id: 'u1003',
    firstName: 'Priya',
    lastName: 'Nair',
    userName: 'priyanair',
    avatar: null,
    userVerificationStatus: UserVerificationStatus.underVerification,
  ),
  UserSummary(
    id: 'u1004',
    firstName: 'Arjun',
    lastName: 'Verma',
    userName: 'arjun_v',
    avatar: const UserAvatarModel(
      url: 'https://i.pravatar.cc/150?img=4',
      storagePath: 'avatars/u1004.jpg',
    ),
    userVerificationStatus: UserVerificationStatus.verified,
  ),
  UserSummary(
    id: 'u1005',
    firstName: 'Sneha',
    lastName: 'Iyer',
    userName: 'sneha.iyer',
    avatar: const UserAvatarModel(
      url: null,
      storagePath: 'avatars/u1005.jpg',
    ),
    userVerificationStatus: UserVerificationStatus.notVerified,
  ),
  UserSummary(
    id: 'u1006',
    firstName: 'Karan',
    lastName: 'Singh',
    userName: 'karansingh07',
    avatar: const UserAvatarModel(
      url: 'https://i.pravatar.cc/150?img=6',
      storagePath: 'avatars/u1006.jpg',
    ),
    userVerificationStatus: UserVerificationStatus.verificationFailed,
  ),
  UserSummary(
    id: 'u1007',
    firstName: 'Divya',
    lastName: 'Rao',
    userName: 'divya_rao',
    avatar: null,
    userVerificationStatus: UserVerificationStatus.verified,
  ),
  UserSummary(
    id: 'u1008',
    firstName: 'Aditya',
    lastName: 'Kulkarni',
    userName: 'aditya.k',
    avatar: const UserAvatarModel(
      url: 'https://i.pravatar.cc/150?img=8',
      storagePath: 'avatars/u1008.jpg',
    ),
    userVerificationStatus: UserVerificationStatus.verified,
  ),
  UserSummary(
    id: 'u1009',
    firstName: 'Meera',
    lastName: 'Joshi',
    userName: 'meerajoshi',
    avatar: const UserAvatarModel(
      url: 'https://i.pravatar.cc/150?img=9',
      storagePath: 'avatars/u1009.jpg',
    ),
    userVerificationStatus: UserVerificationStatus.underVerification,
  ),
  UserSummary(
    id: 'u1010',
    firstName: 'Vikram',
    lastName: 'Reddy',
    userName: 'vikram_reddy',
    avatar: null,
    userVerificationStatus: UserVerificationStatus.notVerified,
  ),
];
