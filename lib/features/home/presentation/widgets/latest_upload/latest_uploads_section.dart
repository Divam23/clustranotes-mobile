import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/home/data/dummy_latest_upload_data.dart';
import 'package:clustranotes_mobile/features/home/presentation/widgets/latest_upload/latest_upload_card.dart';
import 'package:flutter/material.dart';

class LatestUploads extends StatelessWidget {
  const LatestUploads({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "Latest Uploads",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [Text("See All"), Icon(AppIcons.rightArrow)],
              ),
            ),
          ],
        ),
        Column(
          spacing: AppSpacing.itemGap,
          children: [
            ...latestUploadedItems.map((item) {
              return LatestUploadCard(item: item);
            }),
          ],
        ),
      ],
    );
  }
}
