import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/dot.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/chip_item.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/filetype_chip.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/resource_chip.dart';
import 'package:clustranotes_mobile/core/widgets/thumbnail/note_thumbnail.dart';
import 'package:clustranotes_mobile/features/notes/models/note_card_model.dart';
import 'package:clustranotes_mobile/features/notes/presentation/pages/note_details_screen.dart';
import 'package:flutter/material.dart';


class RecommendedCard extends StatelessWidget{
  final NoteCardModel card;
  const RecommendedCard({
    required this.card,
    super.key,
  });

  
  @override
  Widget build(BuildContext context){
  final theme = Theme.of(context);
  final categoryChipConfig = card.category.chip;
  final fileTypeChipConfig =
      AppFileTypeChips.allFileTypes[card.contentType] ?? AppFileTypeChips.pdf;
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const NoteDetailsScreen()));
      },
      borderRadius: AppRadius.card,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.sm,
          horizontal: AppSpacing.sm
        ),
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
            AspectRatio(
              aspectRatio: 3/2,
              child: ClipRRect(
                borderRadius: AppRadius.image,
                child: NoteThumbnail(
                  contentType: card.contentType,
                  thumbnailUrl: card.thumbnailUrl,
                ), 
              ),
            ),
            const SizedBox(height: AppSpacing.xxs,),
            Expanded(
              child: Column(
                spacing: AppSpacing.xs,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    card.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleLarge,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: AppSpacing.xs,
                      children: [
                        if(card.semester != null)...[
                          Text(
                              "Semester ${card.semester}",
                              style: theme.textTheme.labelMedium?.copyWith(
                                  color: theme.colorScheme.onSecondary
                              )
                          ),
                          Dot(radius: 4, color: theme.colorScheme.primary)
                        ],
                        Text(
                          card.subject,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.onSecondary
                          ),
                        ),
                      ],
                    ),
                  ),
                  if(card.collegeName != null)...[
                    Text(
                      card.collegeName!,
                      style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.onSecondary
                      ),
                    ),
                    
                  ],
                  if(card.university != null)...[
                    Text(
                      card.university!,
                      style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.primary
                      ),
                    ),
                    
                  ],
                  Row(
                    spacing: AppSpacing.sm, 
                    children: [
                      AppChip(item: categoryChipConfig),
                      AppChip(item: fileTypeChipConfig),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
