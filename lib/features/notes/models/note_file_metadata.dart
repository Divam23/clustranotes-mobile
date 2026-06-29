class NoteFileMetadata {
  final String url;
  final String storagePath;
  final String mimeType;
  final int sizeInBytes;
  final String? thumbnailUrl;
  final int pageCount;
  final int readingTime;

  const NoteFileMetadata({
    required this.url,
    required this.storagePath,
    required this.mimeType,
    required this.sizeInBytes,
    this.thumbnailUrl,
    required this.pageCount,
    required this.readingTime,
  });

  factory NoteFileMetadata.fromJson(Map<String, dynamic> json) {
    return NoteFileMetadata(
      url: json['url'] as String,
      storagePath: json['storagePath'] as String,
      mimeType: json['mimeType'] as String,
      sizeInBytes: (json['size'] as num?)?.toInt() ?? 0,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      pageCount: (json['pageCount'] as num?)?.toInt() ?? 0,
      readingTime: (json['readingTime'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'storagePath': storagePath,
      'mimeType': mimeType,
      'size': sizeInBytes,
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      'pageCount': pageCount,
      'readingTime': readingTime,
    };
  }
}
