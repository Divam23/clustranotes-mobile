import 'package:clustranotes_mobile/core/widgets/button/app_back_button.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_dashboard_screen_widgets/upload_guidelines_section/upload_guidelines_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_file_section/choose_file_for_upload_popup.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_file_section/upload_file_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_metadata_section/upload_note_metadata_section.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadNoteScreen extends ConsumerStatefulWidget {
  const UploadNoteScreen({super.key});

  @override
  ConsumerState<UploadNoteScreen> createState() => _UploadNoteScreenState();
}

class _UploadNoteScreenState extends ConsumerState<UploadNoteScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final upload = ref.watch(uploadProvider);
    debugPrint("Build whole screen");
    return Scaffold(
      extendBodyBehindAppBar: true,
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
        
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenPadding,
            vertical: AppSpacing.md,
          ),
          child: Column(
            children: [
              UploadFileSection(
                onTap: () async {
                  if (!context.mounted) return;
                  showUploadFilePickerType(context);
                },
                isGeneratingPDF: upload.isGeneratingPDF,
                isPickingImages: upload.isPickingDocument,
              ),
              const SizedBox(height: AppSpacing.section),
              UploadNoteMetadataSection(),
            ],
          ),
        ),
      ),
    );
  }
}
