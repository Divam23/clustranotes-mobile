import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_upload_status_enum.dart';
import 'package:flutter/material.dart';

class UploadProgressCircle extends StatelessWidget{
  const UploadProgressCircle({
    super.key,
    required this.progress,
    this.size = 160,
    this.strokeWidth = 10,
    required this.uploadStatus,
  });

  final double progress;
  final double size;
  final double strokeWidth;
  final NoteUploadStatus uploadStatus;

  @override
  Widget build(BuildContext context) {
    final clampedProgress = progress.clamp(0.0, 1.0);
    final color =  AppColors.success;
    
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: clampedProgress,
              strokeWidth: strokeWidth,
              strokeCap: StrokeCap.butt,
              backgroundColor:
              Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
          ),
          Text(
            '${(clampedProgress * 100).roundToDouble()}%',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
