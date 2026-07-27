import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/upload/presentation/extension/note_category_enums_ui_showcase.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_review_screen_widgets/preview_tags_row.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_review_screen_widgets/review_section_header.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_review_screen_widgets/single_detail_row.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsPreviewSection extends ConsumerWidget {
  const DetailsPreviewSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final upload = ref.read(uploadProvider);
    String? formattedSemesterValue;
    if(upload.semester != null){
      formattedSemesterValue = "Semester ${upload.semester}";
    }
    final detailSection = [
      DetailItem(icon: AppIcons.title, label: "Title", value: upload.title),
      DetailItem(icon: AppIcons.subject, label: "Subject", value: upload.subject),
      DetailItem(icon: AppIcons.course, label: "Course", value: upload.course),
      DetailItem(icon: AppIcons.branch, label: "Branch", value: upload.branch),
      DetailItem(icon: AppIcons.semester, label: "Semester", value: formattedSemesterValue),
      DetailItem(icon: AppIcons.category, label: "Category", value: upload.noteCategory.displayName),
      DetailItem(icon: AppIcons.college, label: "College", value: upload.collegeName),
      DetailItem(icon: AppIcons.university, label: "University", value: upload.university),
      DetailItem(icon: AppIcons.description, label: "Description", value: upload.description),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: AppRadius.card,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.1),
            offset: Offset(0, 1),
            spreadRadius: 1,
            blurRadius: 1,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: Column(
        children: [
          ReviewSectionHeader(
            icon: AppIcons.details,
            sectionNumber: 2,
            sectionTitle: "Details",
          ),
          Column(
            children: [
              Column(
                children: detailSection.map((detail) {
                  return 
                    SingleDetailRow(item: detail);
                }).toList(),
              ),
              PreviewTagsRow()
            ],
          ),
        ],
      ),
    );
  }
}
