enum NoteContentType { pdf, docx, pptx, ppt, doc }

extension NoteContentTypeJson on NoteContentType {
  static NoteContentType fromJson(String value) {
    return fromExtension(value);
  }
  static NoteContentType fromExtension(String extension) {
    switch (extension) {
      case 'doc':
        return NoteContentType.doc;
      case 'docx':
        return NoteContentType.docx;
      case 'ppt':
        return NoteContentType.ppt;
      case 'pptx':
        return NoteContentType.pptx;
      case 'pdf':
        return NoteContentType.pdf;
      default:
        throw UnsupportedError(
          'Unsupported file type: $extension',
        );
    }
  }

  String toJson() => toExtension();

  String toExtension() {
    switch (this) {
      case NoteContentType.pdf:
        return 'pdf';
      case NoteContentType.doc:
        return 'doc';
      case NoteContentType.docx:
        return 'docx';
      case NoteContentType.ppt:
        return 'ppt';
      case NoteContentType.pptx:
        return 'pptx';
    }
  }
}
