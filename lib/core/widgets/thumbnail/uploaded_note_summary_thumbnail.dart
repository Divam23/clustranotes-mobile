import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/notes/models/note_enums.dart';
import 'package:flutter/material.dart';

class UploadedNoteSummaryThumbnail extends StatelessWidget{
  final NoteContentType noteContentType;
  const UploadedNoteSummaryThumbnail({required this.noteContentType, super.key});
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    final color = _getColor(context); 
    
    return Container(
      height: 60,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: AppRadius.button,
        color: theme.colorScheme.primary.withValues(alpha: 0.2),
      ),
      child: Center(
        child: Icon(
          _getIcon(),
          color: color,
          size: 30,
        ),
      ),
    );
  }

  IconData _getIcon() {
    switch (noteContentType) {
      case NoteContentType.pdf:
        return Icons.picture_as_pdf;

      case NoteContentType.docx:
      case NoteContentType.doc:
        return Icons.description;

      case NoteContentType.pptx:
      case NoteContentType.ppt:
        return Icons.slideshow;
      default:
        return Icons.picture_as_pdf;
    }
  }

  Color _getColor(BuildContext context) {
    switch (noteContentType) {
      case NoteContentType.pdf:
        return Colors.red;

      case NoteContentType.docx:
      case NoteContentType.doc:
        return Colors.blue;

      case NoteContentType.pptx:
      case NoteContentType.ppt:
        return Colors.orange;
      
    }
  }
}
