import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';

class AppLike extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        spacing: AppSpacing.xs,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
              isLiked
                ? AppIcons.likeFilled
                : AppIcons.like,
              color: AppColors.error,
            size: size,
            ),
          if (count != null) ...[
            Text(NumberFormatter.compact(count!)),
          ],
        ],
      ),
    );
  }
}
