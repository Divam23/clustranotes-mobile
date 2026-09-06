class ContributionStatsModel{
  final String userId;
  final int totalNotesCount;
  final int draftNotesCount;
  final int verifiedNotesCount;
  final int publishedNotesCount;
  final int unverifiedNotesCount;
  final int rejectedNotesCount;
  final int archivedNotesCount;
  final int removedNotesCount;
  final int pendingReviewNotesCount;
  final int totalViewsCount;
  final int totalLikesCount;
  final int totalDownloadsCount;
  
  const ContributionStatsModel({
    required this.userId,  
    required this.totalNotesCount,
    required this.draftNotesCount,
    required this.verifiedNotesCount,  
    required this.publishedNotesCount,  
    required this.unverifiedNotesCount,  
    required this.rejectedNotesCount,  
    required this.archivedNotesCount,  
    required this.removedNotesCount,  
    required this.pendingReviewNotesCount,  
    required this.totalDownloadsCount,  
    required this.totalLikesCount,  
    required this.totalViewsCount,  
  });
}
