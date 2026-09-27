import 'package:clustranotes_mobile/app/router/app_route_paths.dart';
import 'package:clustranotes_mobile/core/widgets/button/app_back_button.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_progress_screen_widgets/upload_note_card.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_progress_screen_widgets/upload_progress_action_button.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_progress_screen_widgets/upload_progress_circle.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_progress_screen_widgets/upload_progress_screen_header.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:go_router/go_router.dart';

class UploadProgressScreen extends ConsumerWidget {
  const UploadProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(uploadProvider).uploadProgress;
    final uploadStatus = ref.watch(uploadProvider).noteUploadStatus;
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
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
                UploadProgressScreenHeader(uploadStatus: uploadStatus),
                const SizedBox(height: AppSpacing.section),
                UploadStatusBadge(progress: progress, status: uploadStatus),
                const SizedBox(height: AppSpacing.section),
                UploadNoteCard(),
                const SizedBox(height: AppSpacing.section),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenPadding,
            vertical: AppSpacing.sm,
          ),
          child: UploadProgressActionButton(
            uploadStatus: uploadStatus,
            onRetry: () {
              ref.watch(uploadProvider.notifier).retryNoteUpload();
            },
            onCancel: () {
              ref.watch(uploadProvider.notifier).cancelUpload();
              print(uploadStatus);
            },
            onDone: () {
              ref.watch(uploadProvider.notifier).uploadDone();
              context.pushReplacement(AppRoutePaths.upload);
            },
          ),
        ),
      ),
    );
  }
}
