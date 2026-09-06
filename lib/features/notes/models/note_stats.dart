class NoteStats {
  final int viewsCount;
  final int downloadCount;
  final int likesCount;
  final int bookmarksCount;
  final int commentsCount;
  final double ratingsAverage;
  final int ratingsCount;
  final DateTime? lastViewedAt;

  const NoteStats({
    required this.viewsCount,
    required this.downloadCount,
    required this.likesCount,
    required this.bookmarksCount,
    required this.commentsCount,
    required this.ratingsCount,
    required this.ratingsAverage,
    this.lastViewedAt
  });

}
