class UploadedNoteStats {
  final int viewsCount;
  final int downloadCount;
  final double ratingsAverage;
  final int ratingsCount;
  final int likesCount;
  final int bookmarksCount;

  const UploadedNoteStats({
    required this.viewsCount,
    required this.downloadCount,
    required this.ratingsAverage,
    required this.ratingsCount,
    required this.likesCount,
    required this.bookmarksCount,
  });
}
