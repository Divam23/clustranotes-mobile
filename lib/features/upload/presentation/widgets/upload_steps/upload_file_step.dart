import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_file_section/choose_file_for_upload_popup.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_file_section/upload_file_section.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadFileStep extends ConsumerWidget {
  const UploadFileStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upload = ref.watch(uploadProvider);
    return  UploadFileSection(
      onTap: () {
        if (!context.mounted) return;
        showUploadFilePickerType(context);
      },
      isGeneratingPDF: upload.isGeneratingPDF,
      isPickingImages: upload.isPickingDocument,
    );
  }
}
