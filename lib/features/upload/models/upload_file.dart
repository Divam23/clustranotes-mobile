import 'dart:io';
import 'package:clustranotes_mobile/core/models/note_content_type_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/upload_source_enums.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class UploadFile{
  final File file;
  final NoteContentType contentType;
  final List<XFile>? selectedImages;
  final UploadSource uploadSource;
  final int sizeInBytes;
  final int? pageCount;

  String get fileName => p.basename(file.path);
  
  const UploadFile({
    required this.file,
    required this.contentType,
    required this.sizeInBytes,
    this.pageCount,
    this.selectedImages,
    required this.uploadSource,
  });  
}
