import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_review_screen_widgets/details_preview_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_review_screen_widgets/upload_document_preview_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadNoteReviewScreen extends ConsumerWidget{
  const UploadNoteReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final theme = Theme.of(context);
    return Column(
      spacing: AppSpacing.sectionGap,
      children: [
        UploadDocumentPreviewSection(),
        DetailsPreviewSection()
      ],
    );
  }
}
