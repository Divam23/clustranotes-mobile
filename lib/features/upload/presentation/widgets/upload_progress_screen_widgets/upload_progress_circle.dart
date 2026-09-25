import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_upload_status_enum.dart';

class UploadStatusBadge extends StatelessWidget {
  final NoteUploadStatus status;
  final double progress; // 0.0 to 1.0

  const UploadStatusBadge({
    required this.status,
    required this.progress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const double size = 150.0;

    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        child: SizedBox(
          key: ValueKey(status),
          width: size,
          height: size,
          child: switch (status) {
            NoteUploadStatus.uploading => _buildProgressRing(theme),
            NoteUploadStatus.success => _buildIconBadge(
              theme: theme,
              backgroundColor: const Color(0xFFE8F8EE),
              iconColor: const Color(0xFF1CB055),
              icon: Icons.check_rounded,
            ),
            NoteUploadStatus.failure => _buildIconBadge(
              theme: theme,
              backgroundColor: const Color(0xFFFDEEEC),
              iconColor: const Color(0xFFEA4335),
              icon: Icons.close_rounded,
            ),
            NoteUploadStatus.cancelled => _buildIconBadge(
              theme: theme,
              backgroundColor: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
              iconColor: const Color(0xFF6B7280),
              icon: Icons.remove_rounded,
            ),
            NoteUploadStatus.idle => const SizedBox.shrink(),
          },
        ),
      ),
    );
  }

  Widget _buildProgressRing(ThemeData theme) {
    final clamped = progress.clamp(0.0, 1.0);

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      tween: Tween<double>(begin: 0.0, end: clamped),
      builder: (context, animatedValue, _) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.primary.withValues(alpha: 0.04),
              ),
            ),

            SizedBox(
              width: 130,
              height: 130,
              child: CircularProgressIndicator(
                value: animatedValue,
                strokeWidth: 8,
                strokeCap: StrokeCap.round,
                backgroundColor: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
              ),
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${(animatedValue * 100).round()}%',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Uploading...',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildIconBadge({
    required ThemeData theme,
    required Color backgroundColor,
    required Color iconColor,
    required IconData icon,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 136,
          height: 136,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
        ),

        Container(
          width: 76,
          height: 76,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: iconColor,
            boxShadow: [
              BoxShadow(
                color: iconColor.withValues(alpha: 0.28),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 42,
          ),
        ),
      ],
    );
  }
}
