class NoteFile {
  final String url;

  final String mimeType;

  final int? sizeInBytes;

  final String? thumbnailUrl;

  final int? pageCount;

  final int? readingTime;

  const NoteFile({
    required this.url,
    required this.mimeType,
    this.sizeInBytes,
    this.thumbnailUrl,
    this.pageCount,
    this.readingTime,
  });
}
