class NoteStats {
  final int viewsCount;
  final int downloadCount;
  final int likesCount;
  final int bookmarksCount;
  final int commentsCount;
  final DateTime? lastViewedAt;

  const NoteStats({
    required this.viewsCount,
    required this.downloadCount,
    required this.likesCount,
    required this.bookmarksCount,
    required this.commentsCount,
    this.lastViewedAt
  });

  factory NoteStats.fromJson(Map<String, dynamic>? json) {
    final j = json ?? {};
    return NoteStats(
      viewsCount: (j['viewsCount'] as num?)?.toInt() ?? 0,
      downloadCount: (j['downloadCount'] as num?)?.toInt() ?? 0,
      likesCount: (j['likesCount'] as num?)?.toInt() ?? 0,
      bookmarksCount: (j['bookmarksCount'] as num?)?.toInt() ?? 0,
      commentsCount: (j['commentsCount'] as num?)?.toInt() ?? 0,
      lastViewedAt: j['lastViewedAt'] != null
          ? DateTime.parse(j['lastViewedAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'viewsCount': viewsCount,
      'downloadCount': downloadCount,
      'likesCount': likesCount,
      'bookmarksCount': bookmarksCount,
      'commentsCount': commentsCount,
      if (lastViewedAt != null) 'lastViewedAt': lastViewedAt!.toIso8601String(),
    };
  }
}
