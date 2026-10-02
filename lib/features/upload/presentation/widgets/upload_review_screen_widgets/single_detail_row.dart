import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter/material.dart';

class DetailItem {
  final IconData icon;
  final String label;
  final String? value;

  const DetailItem({required this.icon, required this.label, this.value});
}

class SingleDetailRow extends StatelessWidget {
  final DetailItem item;
  const SingleDetailRow({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: theme.disabledColor.withValues(alpha: 0.1),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.md,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 140,
              child: Row(
                spacing: AppSpacing.xs,
                children: [
                  Icon(
                    item.icon,
                    color: AppColors.primarySky,
                  ),
                  Flexible(
                    child: Text(
                      item.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            item.value != null
                ? Expanded(child: Text(item.value!))
                : Expanded(child: Text("-")),
          ],
        ),
      ),
    );
  }
}
