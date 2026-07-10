import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class DragDots extends StatelessWidget {
  const DragDots({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return SizedBox(
      width: 15,
      height: 16,
      child: Wrap(
        spacing: AppSpacing.xxs,
        runSpacing: 3,
        children: List.generate(
          9,
          (_) => Container(
            width: 3,
            height: 3,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
