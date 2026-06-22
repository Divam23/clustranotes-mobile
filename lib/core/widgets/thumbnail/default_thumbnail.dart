import 'package:clustranotes_mobile/app/theme/app_radius.dart';
import 'package:flutter/material.dart';

class DefaultNoteThumbnail extends StatelessWidget {
  final String contentType;
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
    switch (contentType.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf;

      case 'docx':
      case 'doc':
        return Icons.description;

      case 'pptx':
      case 'ppt':
        return Icons.slideshow;

      default:
        return Icons.insert_drive_file;
    }
  }

  Color _getColor(BuildContext context) {
    switch (contentType.toLowerCase()) {
      case 'pdf':
        return Colors.red;

      case 'docx':
      case 'doc':
        return Colors.blue;

      case 'pptx':
      case 'ppt':
        return Colors.orange;

      default:
        return Theme.of(context).colorScheme.primary;
    }
  }
}

