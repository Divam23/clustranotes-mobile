import 'package:clustranotes_mobile/features/upload/models/contribution_stats_model.dart';

const newUserStats = ContributionStatsModel(
  userId: 'user_001',
  totalNotesCount: 4,
  draftNotesCount: 1,
  verifiedNotesCount: 0,
  publishedNotesCount: 2,
  unverifiedNotesCount: 2,
  rejectedNotesCount: 0,
  archivedNotesCount: 0,
  removedNotesCount: 0,
  pendingReviewNotesCount: 1,
  totalViewsCount: 27,
  totalLikesCount: 5,
  totalDownloadsCount: 8,
);

const averageUserStats = ContributionStatsModel(
  userId: 'user_002',
  totalNotesCount: 42,
  draftNotesCount: 4,
  verifiedNotesCount: 18,
  publishedNotesCount: 30,
  unverifiedNotesCount: 9,
  rejectedNotesCount: 2,
  archivedNotesCount: 3,
  removedNotesCount: 0,
  pendingReviewNotesCount: 3,
  totalViewsCount: 8241,
  totalLikesCount: 653,
  totalDownloadsCount: 1142,
);

const topContributorStats = ContributionStatsModel(
  userId: 'user_003',
  totalNotesCount: 138,
  draftNotesCount: 7,
  verifiedNotesCount: 82,
  publishedNotesCount: 115,
  unverifiedNotesCount: 24,
  rejectedNotesCount: 5,
  archivedNotesCount: 11,
  removedNotesCount: 1,
  pendingReviewNotesCount: 8,
  totalViewsCount: 54281,
  totalLikesCount: 4287,
  totalDownloadsCount: 13652,
);

const dummyContributionStats = ContributionStatsModel(
  userId: 'divam_001',
  totalNotesCount: 42,
  draftNotesCount: 4,
  verifiedNotesCount: 18,
  publishedNotesCount: 30,
  unverifiedNotesCount: 9,
  rejectedNotesCount: 2,
  archivedNotesCount: 3,
  removedNotesCount: 0,
  pendingReviewNotesCount: 3,
  totalViewsCount: 8241,
  totalLikesCount: 653,
  totalDownloadsCount: 1142,
);
