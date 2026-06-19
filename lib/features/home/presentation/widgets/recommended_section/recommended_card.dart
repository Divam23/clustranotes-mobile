import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/notes/presentation/pages/note_details_screen.dart';
import 'package:flutter/material.dart';

class RecommendedItem {
  final String title;
  final String thumbnail;
  final String semester;
  final String course;
  final String subject;
  final String fileType;
  final String category;
  final String collegeName;

  const RecommendedItem({
    required this.title,
    required this.thumbnail,
    required this.semester,
    required this.course,
    required this.subject,
    required this.fileType,
    required this.category,
    required this.collegeName,
  });
}

class RecommendedCard extends StatelessWidget{
  final RecommendedItem item;
  const RecommendedCard({
    required this.item,
    super.key,
  });

  
  @override
  Widget build(BuildContext context){
  final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const NoteDetailsScreen()));
      },
      borderRadius: AppRadius.card,
      child: Container(
        height: 275,
        width: 250,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: AppRadius.card,
          border: Border.all(
              color: theme.disabledColor.withValues(alpha: 0.1)
          )
        ),
        child: Column(
          children: [
            Container(
              height: 170,
              width: 250,
              padding: const EdgeInsets.all(AppSpacing.sm),
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
            const SizedBox(height: AppSpacing.xxs,),
            Container(
              //height: 90,
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Column(
                spacing: 3,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: theme.textTheme.titleLarge,
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      Text(
                          item.semester,
                          style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.onSecondary
                          )
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
                              color: theme.colorScheme.onSecondary
                          )
                      ),
                    ],
                  ),

                  Text(
                    item.collegeName,
                    style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSecondary
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs,),
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
                            borderRadius: AppRadius.chip
                        ),
                        child: Center(
                          child: Text(
                              textAlign: TextAlign.center,
                              item.category,
                              style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.primary
                              )
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
                            borderRadius: AppRadius.chip
                        ),
                        child: Center(
                          child: Text(
                              textAlign: TextAlign.center,
                              item.fileType,
                              style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.error
                              )
                          ),
                        ),
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
