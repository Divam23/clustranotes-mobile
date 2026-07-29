import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_review_screen_widgets/details_preview_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_review_screen_widgets/terms_and_declarations_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_review_screen_widgets/upload_document_preview_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_review_screen_widgets/upload_note_settings_review_section.dart';
import 'package:flutter/material.dart';

class UploadNoteReviewScreen extends StatelessWidget{
  const UploadNoteReviewScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
      spacing: AppSpacing.sectionGap,
      children: [
        UploadDocumentPreviewSection(),
        DetailsPreviewSection(),
        UploadNoteSettingsReviewSection(),
        TermsAndDeclarationsSection()
      ],
    );
  }
}
