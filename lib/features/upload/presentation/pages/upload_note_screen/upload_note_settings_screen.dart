import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/button/app_back_button.dart';
import 'package:clustranotes_mobile/core/widgets/button/multi_utility_button.dart';
import 'package:clustranotes_mobile/features/upload/presentation/pages/upload_note_screen/upload_note_review_screen.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_dashboard_screen_widgets/upload_guidelines_section/upload_guidelines_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_metadata_section/note_classification_section.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadNoteSettingsScreen extends ConsumerWidget {
  const UploadNoteSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final upload = ref.watch(uploadProvider);
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        leading: const AppBackButton(),
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Upload Note", style: theme.textTheme.titleLarge),
            Text(
              "Share your knowledge",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              showUploadGuidelines(context);
            },
            icon: Icon(AppIcons.info),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding,
                  vertical: AppSpacing.md,
                ),
                child: Column(
                  children: [
                    NoteClassificationSection(),
                    
                  ]
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPadding,
                vertical: AppSpacing.md,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MultiUtilityButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const UploadNoteReviewScreen(),
                          ),
                        );
                      },
                      text: "Review Note",
                      borderRadius: AppRadius.searchBarRounded,
                      buttonColor: theme.colorScheme.primary,
                      buttonTextColor: theme.colorScheme.onPrimary,
                    ),
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
