import 'package:clustranotes_mobile/core/widgets/button/app_back_button.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_progress_screen_widgets/upload_progress_circle.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_progress_screen_widgets/upload_progress_screen_header.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';

class UploadProgressScreen extends ConsumerWidget {
  const UploadProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(uploadProvider).uploadProgress;
    final uploadStatus = ref.watch(uploadProvider).noteUploadStatus;
    return Scaffold(
      appBar: AppBar(leading: const AppBackButton(),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenPadding,
              vertical: AppSpacing.sm,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UploadProgressScreenHeader(uploadStatus: uploadStatus,),
                const SizedBox(height: AppSpacing.section),
                UploadProgressCircle(progress: progress, size: 180, strokeWidth: 13, uploadStatus: uploadStatus,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
