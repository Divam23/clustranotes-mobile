import 'package:clustranotes_mobile/core/widgets/button/app_back_button.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_guidelines_section/upload_guidelines_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_guidelines_section/upload_guidelines_sheet.dart';
import 'package:clustranotes_mobile/features/upload/services/images_to_pdf_service.dart';
import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';

class UploadNoteScreen extends StatelessWidget {
  const UploadNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenPadding,
          vertical: AppSpacing.md,
        ),
        child: Center(
          child: FilledButton(
            onPressed: () async {
              final images = await ImagePicker().pickMultiImage();

              if (images.isEmpty) return;

              final pdf = await ImagesToPdfService().generate(images);

              await OpenFilex.open(pdf.path);

              debugPrint(pdf.path);
              debugPrint("${await pdf.length()} bytes");
            },
            child: const Text("Test Images"),
          ),
        ),
      ),
    );
  }
}
