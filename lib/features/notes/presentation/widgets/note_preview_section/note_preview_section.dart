import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/chip_item.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/filetype_chip.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/resource_chip.dart';
import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/features/notes/models/note_model.dart';

class NotePreviewSection extends StatelessWidget{
  final Note note;
  const NotePreviewSection({required this.note, super.key});

  @override
  Widget build(BuildContext context){
    final categoryConfig = AppCategoryChips.allCategories[note.category] ?? AppCategoryChips.others;
    final fileTypeConfig = AppFileTypeChips.allFileTypes[note.contentType] ?? AppFileTypeChips.pdf;
    final theme = Theme.of(context);
    return Stack(
      children: [
        Image.network("https://images.unsplash.com/photo-1516321318423-f06f85e504b3"),
        Positioned(
          bottom: AppSpacing.sm,
          left: AppSpacing.sm,
          child: Row(
            spacing: AppSpacing.sm,
            children: [
              AppChip(
                item: categoryConfig
              ),
              AppChip(
                item: fileTypeConfig
              ),
            ],
          ),
        ),
        Positioned(
          right: AppSpacing.sm,
          bottom: AppSpacing.sm,
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.xs),
            decoration: BoxDecoration(
              color: AppColors.success,
              borderRadius: AppRadius.chip
            ),
            child: Center(
              child: Text(
                '${note.stats.downloadCount} downloads',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onPrimary
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
