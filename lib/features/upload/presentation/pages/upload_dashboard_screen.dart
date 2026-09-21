import 'package:clustranotes_mobile/app/router/app_route_paths.dart';
import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/core/widgets/button/floating_action_button.dart';
import 'package:clustranotes_mobile/features/upload/data/contribution_stat_data.dart';
import 'package:clustranotes_mobile/features/upload/data/uploaded_summary_dummy_data.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_upload_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_dashboard_screen_widgets/contribution_header_section/contribution_header.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_dashboard_screen_widgets/contribution_summary_section/contribution_summary_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_dashboard_screen_widgets/my_uploads_section/my_uploads_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_dashboard_screen_widgets/upload_guidelines_section/upload_guidelines_section.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UploadDashboardScreen extends ConsumerStatefulWidget {
  const UploadDashboardScreen({super.key});

  @override
  ConsumerState<UploadDashboardScreen> createState() => _UploadDashboardScreenState();
}

class _UploadDashboardScreenState extends ConsumerState<UploadDashboardScreen> {
  late final contribution = dummyContributionStats;
  
  @override
  Widget build(BuildContext context) {
    final upload = ref.watch(uploadProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.screenPadding),
            child: Column(
              children: [
                const ContributionHeader(),
                const SizedBox(height: AppSpacing.itemGap),
                MyUploadSection(uploadedNotecards: dummyUploadedNotes),
                const SizedBox(height: AppSpacing.itemGap),
                ContributionSummarySection(contribution: contribution),
                const SizedBox(height: AppSpacing.sectionGap),
                UploadGuidelinesSection(),
                const SizedBox(height: AppSpacing.screenPadding),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: AppFloatingActionButton(
        onTap: () {
          upload.noteUploadStatus == NoteUploadStatus.idle ? context.push(AppRoutePaths.uploadFlow) :
          context.push(AppRoutePaths.uploadProgress);
        },
      ),
    );
  }
}
