import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/api/models/note_content_type_enum.dart';
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
        color: fillerColor,
      ),
      child: Center(
        child: Image.asset(
          _getImage(),
          height: 50,
        ),
      ),
    );
  }

  String _getImage() {
    switch (noteContentType) {
      case NoteContentType.pdf:
        return AppIcons.pdfIcon;

      case NoteContentType.docx:
      case NoteContentType.doc:
        return AppIcons.docIcon;

      case NoteContentType.pptx:
      case NoteContentType.ppt:
        return AppIcons.pptIcon;
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
