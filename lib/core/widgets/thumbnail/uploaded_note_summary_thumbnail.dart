import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/models/note_content_type_enum.dart';
import 'package:clustranotes_mobile/features/notes/models/note_enums.dart';
import 'package:flutter/material.dart';

class UploadedNoteSummaryThumbnail extends StatelessWidget{
  final NoteContentType noteContentType;
  final Color? fillerColor;
  final double? height;
  final double? width;
  final BorderRadius borderRadius;
  const UploadedNoteSummaryThumbnail({required this.noteContentType, this.width, this.height, this.fillerColor, this.borderRadius = AppRadius.button,  super.key});
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    final color = _getColor(context); 
    
    return Container(
      height: height ?? 60,
      width: width ?? 50,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: fillerColor ?? theme.colorScheme.primary.withValues(alpha: 0.2),
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
