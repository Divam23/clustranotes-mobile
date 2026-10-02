import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLike extends StatefulWidget {
  final bool isLiked;
  final VoidCallback onTap;
  final int? count;
  final double? size;

  const AppLike({
    required this.isLiked,
    required this.onTap,
    this.size = 20,
    this.count,
    super.key,
  });

  @override
  State<AppLike> createState() => _AppLikeState();
}

class _AppLikeState extends State<AppLike> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
    );
    _scale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.25), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.25, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    HapticFeedback.lightImpact();
    if (!widget.isLiked) {
      _controller.forward(from: 0);
    }
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: _handleTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        spacing: AppSpacing.xs,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _scale,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Icon(
                widget.isLiked ? AppIcons.likeFilled : AppIcons.like,
                key: ValueKey(widget.isLiked),
                color: widget.isLiked
                    ? AppColors.error
                    : theme.colorScheme.onSurfaceVariant,
                size: widget.size,
              ),
            ),
          ),
          if (widget.count != null)
            Text(
              NumberFormatter.compact(widget.count!),
              style: theme.textTheme.labelMedium?.copyWith(
                color: widget.isLiked
                    ? AppColors.error
                    : theme.colorScheme.onSurfaceVariant,
              ),
            ),
        ],
      ),
    );
  }
}
