import 'package:clustranotes_mobile/features/user/data/models/user_response_dto.dart';
import 'package:clustranotes_mobile/features/user/domain/models/user_avatar.dart';

import 'package:clustranotes_mobile/features/user/domain/models/user_model.dart';
import 'package:clustranotes_mobile/features/user/domain/models/user_notification_preferences.dart';
import 'package:clustranotes_mobile/features/user/domain/models/user_preferences.dart';
import 'package:clustranotes_mobile/features/user/domain/models/user_stats.dart';

class UserMapper {
  const UserMapper._();
  
  static UserModel toDomain(UserResponseDto dto) {
    return UserModel(
        id: dto.id, 
        firstName: dto.firstName, 
        lastName: dto.lastName, 
        email: dto.email, 
        userName: dto.userName, 
        avatar: UserAvatarModel(
          url: dto.avatar.url,
          storagePath: dto.avatar.storagePath,
        ), 
        bio: dto.bio, 
        college: dto.college, 
        course: dto.course,
        //List.unmodifiable for immutability of enums externally
        subjects: List.unmodifiable(dto.subjects),
        university: dto.university,
        semester: dto.semester,
        roles: List.unmodifiable(dto.roles),
        verificationStatus: dto.verificationStatus,
        preferences: UserPreferences(
          language: dto.preferences.language,
          theme: dto.preferences.theme,
          notifications: UserNotificationPreferences(
              email: dto.preferences.notifications.email, 
              push: dto.preferences.notifications.push,
              marketing: dto.preferences.notifications.marketing
          )
        ),
        stats: UserStats(
            reputationScore: dto.stats.reputationScore,
            notesUploadedCount: dto.stats.notesUploadedCount,
            totalDownloads: dto.stats.totalDownloads,
            totalViews: dto.stats.totalViews,
            followersCount: dto.stats.followersCount,
            followingCount: dto.stats.followingCount
        ),
        createdAt: dto.createdAt,
        updatedAt: dto.updatedAt
    );
  }
}
