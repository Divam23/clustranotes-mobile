import 'package:clustranotes_mobile/core/widgets/button/bookmark_button.dart';
import 'package:clustranotes_mobile/core/widgets/dot.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/chip_item.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/filetype_chip.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/resource_chip.dart';
import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';


class SearchResultNoteCardItem {
  final String title;
  final String thumbnail;
  final String semester;
  final String subject;
  final String collegeName;
  final String category;
  final String fileType;
  final String downloadCount;
  final String uploadTime;
  final String authorName;

  const SearchResultNoteCardItem({
    required this.title,
    required this.thumbnail,
    required this.semester,
    required this.subject,
    required this.collegeName,
    required this.category,
    required this.fileType,
    required this.downloadCount,
    required this.uploadTime,
    required this.authorName,
  });
}

class SearchResultNoteCard extends StatelessWidget{
  final SearchResultNoteCardItem item;
  const SearchResultNoteCard({required this.item, super.key});
  
  @override
  Widget build(BuildContext context){
    final categoryConfig = AppCategoryChips.allCategories[item.category] ?? AppCategoryChips.others;
    final fileTypeConfig = AppFileTypeChips.allFileTypes[item.fileType] ?? AppFileTypeChips.pdf;
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: 115,
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          border: Border.all(color: theme.disabledColor.withValues(alpha: 0.1)),
          borderRadius: AppRadius.card
        ),
        child: Row(
          children: [
            Container(
              width: 90,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: theme.dividerColor.withValues(alpha: 0.3),
                  ),
                ),
              ),
              child: ClipRRect(
                borderRadius: AppRadius.card.copyWith(
                  topRight: Radius.zero,
                  bottomRight: Radius.zero,
                ),
                child: Image.network(
                  item.thumbnail,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 5,
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            maxLines: 1,
                            style: theme.textTheme.titleLarge,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        AppBookmarkButton(onPressed: (){}),
                      ],
                    ),
                    
                    Row(
                      spacing: AppSpacing.xs,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          item.semester,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.colorScheme.onSecondary,
                          ),
                        ),
                        Dot(radius: 4, color: theme.colorScheme.primary),
                        Flexible(
                          child: Text(
                            item.subject,
                            maxLines: 1,
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.onSecondary,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Dot(radius: 4, color: theme.colorScheme.primary),
                        Flexible(
                          child: Text(
                            item.authorName,
                            maxLines: 1,
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.onSecondary,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        Wrap(
                        spacing: AppSpacing.md,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Row(
                            spacing: AppSpacing.md,
                            children: [
                              Row(
                                spacing: AppSpacing.xs,
                                children: [
                                  Icon(
                                    AppIcons.download,
                                    color: theme.colorScheme.onSecondary,
                                    size: 15,
                                  ),
                                  Text(
                                    item.downloadCount,
                                    style: theme.textTheme.labelMedium
                                        ?.copyWith(
                                      color: theme.colorScheme.onSecondary,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                spacing: AppSpacing.xs,
                                children: [
                                  Icon(
                                    AppIcons.clock,
                                    color: theme.colorScheme.onSecondary,
                                    size: 15,
                                  ),
                                  Text(
                                    item.uploadTime,
                                    style: theme.textTheme.labelMedium
                                        ?.copyWith(
                                      color: theme.colorScheme.onSecondary,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ), 
                      ]
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      spacing: AppSpacing.sm,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppChip(item: categoryConfig),
                        AppChip(item: fileTypeConfig),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
