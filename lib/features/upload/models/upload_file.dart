import 'dart:io';
import 'package:clustranotes_mobile/features/notes/models/note_enums.dart';

class UploadFile{
  final File file;
  final NoteContentType contentType;
  final bool generatedFromImages;
  
  const UploadFile({
    required this.file,
    required this.contentType,
    this.generatedFromImages = false,
  });  
}
