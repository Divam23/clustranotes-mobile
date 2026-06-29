import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/upload/models/uploaded_note_summary_model.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/my_uploads_section/my_upload_card.dart';
import 'package:flutter/material.dart';

class MyUploadSection extends StatelessWidget {
  final List<UploadedNoteSummary> uploadedNotecards;
  const MyUploadSection({required this.uploadedNotecards, super.key});

  @override
  Widget build(BuildContext context) {
    final visibleUploadedNoteCards = uploadedNotecards.take(3).toList();
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "My Uploads",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text("See All"),
            ),
          ],
        ),
        Column(
          spacing: AppSpacing.itemGap,
          children: visibleUploadedNoteCards
              .map((uploadedCard) => MyUploadCard(uploadedNote: uploadedCard))
              .toList(),
        ),
      ],
    );
  }
}
