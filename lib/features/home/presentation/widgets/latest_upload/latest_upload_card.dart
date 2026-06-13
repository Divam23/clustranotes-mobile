import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/bookmark_button.dart';
import 'package:flutter/material.dart';

class LatestUploadedItem {
  final String title;
  final String thumbnail;
  final String semester;
  final String course;
  final String subject;
  final String fileType;
  final String category;
  final String collegeName;
  final num downloadCount;
  final String uploadTime;
  final String authorName;

  const LatestUploadedItem({
    required this.title,
    required this.thumbnail,
    required this.semester,
    required this.course,
    required this.subject,
    required this.fileType,
    required this.category,
    required this.collegeName,
    required this.downloadCount,
    required this.uploadTime,
    required this.authorName,
  });
}

class LatestUploadCard extends StatelessWidget {
  final LatestUploadedItem item;
  const LatestUploadCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      borderRadius: AppRadius.card,
      child: Container(
        height: 290,
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: AppRadius.card,
          border: Border.all(color: theme.disabledColor.withValues(alpha: 0.1)),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 170,
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: AppRadius.image,
                      border: Border.all(
                        color: Theme.of(context)
                            .disabledColor
                            .withValues(alpha: 0.1),
                        width: 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: AppRadius.image,
                    
                      child: Image.network(
                        item.thumbnail,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: AppSpacing.lg,
                  right: AppSpacing.lg,
                  child: AppBookmarkButton(onPressed: (){})
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xxs),
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Row(
                spacing: 10,
                children: [
                  Column(
                    spacing: 3,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(item.title, style: theme.textTheme.titleLarge),
                      Row(
                        spacing: 5,
                        children: [
                          Text(
                            item.semester,
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.onSecondary,
                            ),
                          ),
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          Text(
                            item.subject,
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.onSecondary,
                            ),
                          ),
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          Text(
                            item.collegeName,
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.onSecondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Wrap(
                        spacing: 10,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Row(
                                spacing: 5,
                                children: [
                                  Icon(
                                    AppIcons.download,
                                    color: theme.colorScheme.onSecondary,
                                    size: 15,
                                  ),
                                  Text(
                                    '${item.downloadCount}',
                                    style: theme.textTheme.labelMedium
                                        ?.copyWith(
                                          color: theme.colorScheme.onSecondary,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 5,
                                children: [
                                  Icon(
                                    AppIcons.clock,
                                    color: theme.colorScheme.onSecondary,
                                    size: 15,
                                  ),
                                  Text(
                                    '${item.uploadTime} by ${item.authorName}',
                                    style: theme.textTheme.labelMedium
                                        ?.copyWith(
                                          color: theme.colorScheme.onSecondary,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Wrap(
                        spacing: 10,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(AppSpacing.xxs),
                            height: 25,
                            width: 50,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withValues(
                                alpha: 0.1,
                              ),
                              borderRadius: AppRadius.chip,
                            ),
                            child: Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                item.category,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(AppSpacing.xxs),
                            height: 25,
                            width: 50,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.error.withValues(
                                alpha: 0.1,
                              ),
                              borderRadius: AppRadius.chip,
                            ),
                            child: Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                item.fileType,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.error,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
