import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_review_screen_widgets/note_preview_card.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_review_screen_widgets/review_section_header.dart';
import 'package:flutter/material.dart';

class UploadDocumentPreviewSection extends StatelessWidget {
  const UploadDocumentPreviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(

        color: theme.colorScheme.surfaceContainer,
        borderRadius: AppRadius.card,
        boxShadow: [BoxShadow(
          color: theme.shadowColor.withValues(alpha: 0.1),
          offset: Offset(0, 1),
          spreadRadius: 1,
          blurRadius: 1,
          blurStyle: BlurStyle.normal
        )]
      ),
      child: Column(
        spacing: AppSpacing.itemGap,
        children: [
          ReviewSectionHeader(
            icon: AppIcons.note,
            sectionNumber: 1,
            sectionTitle: "Document Preview",
          ),
          NotePreviewCard(),
        ],
      ),
    );
  }
}
