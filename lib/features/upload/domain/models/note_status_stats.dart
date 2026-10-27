class NoteStatusStats {
  final int totalNotesCount;
  final int draftNotesCount;
  final int publishedNotesCount;
  final int archivedNotesCount;
  final int removedNotesCount;
  final int deletedNotesCount;
  final int unverifiedNotesCount;
  final int pendingReviewNotesCount;
  final int rejectedNotesCount;
  final int verifiedNotesCount;
  
  const NoteStatusStats({
    required this.totalNotesCount, 
    required this.draftNotesCount, 
    required this.publishedNotesCount,
    required this.archivedNotesCount,
    required this.removedNotesCount,
    required this.deletedNotesCount,
    required this.unverifiedNotesCount,
    required this.pendingReviewNotesCount,
    required this.rejectedNotesCount,
    required this.verifiedNotesCount
  });
}
