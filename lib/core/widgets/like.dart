import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter/material.dart';

class AppLike extends StatelessWidget {
  final bool isLiked;
  final VoidCallback onTap;
  final int? count;

  const AppLike({
    required this.isLiked,
    required this.onTap,
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
            ),
          if (count != null) ...[
            Text('$count'),
          ],
        ],
      ),
    );
  }
}
