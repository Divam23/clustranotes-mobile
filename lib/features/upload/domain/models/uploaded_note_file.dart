class UploadedNoteFile {
  final bool canDownload;
  final int? pageCount;
  final String? thumbnailUrl;

  const UploadedNoteFile({
    required this.canDownload,
    this.thumbnailUrl,
    required this.pageCount
  });

}
