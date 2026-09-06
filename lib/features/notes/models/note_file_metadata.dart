class NoteFileMetadata {
  final String mimeType;
  final int sizeInBytes;
  final String? thumbnailUrl;
  final int pageCount;
  final int readingTime;

  const NoteFileMetadata({
    required this.mimeType,
    required this.sizeInBytes,
    this.thumbnailUrl,
    required this.pageCount,
    required this.readingTime,
  });

}
