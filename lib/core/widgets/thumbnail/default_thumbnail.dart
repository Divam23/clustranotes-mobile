import 'package:clustranotes_mobile/app/theme/app_radius.dart';
import 'package:clustranotes_mobile/features/notes/models/note_enums.dart';
import 'package:flutter/material.dart';

class DefaultNoteThumbnail extends StatelessWidget {
  final NoteContentType contentType;
  final BorderRadius? borderRadius;
  
  const DefaultNoteThumbnail({
    required this.contentType,
    this.borderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = _getColor(context);

    return ClipRRect(
      borderRadius: borderRadius ?? AppRadius.card,
      child: Container(
        height: 160,
        width: double.infinity,
        color: color.withValues(alpha: 0.15),
        alignment: Alignment.center,
        child: Icon(
          _getIcon(),
          size: 56,
          color: color,
        ),
      ),
    );
  }

  IconData _getIcon() {
    switch (contentType) {
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
    switch (contentType) {
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

