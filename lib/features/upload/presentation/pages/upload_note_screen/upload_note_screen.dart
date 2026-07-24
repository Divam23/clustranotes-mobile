import 'package:clustranotes_mobile/core/widgets/button/app_back_button.dart';
import 'package:clustranotes_mobile/core/widgets/button/multi_utility_button.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/common/upload_status_indicator/upload_step_indicator.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_dashboard_screen_widgets/upload_guidelines_section/upload_guidelines_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_steps/upload_file_step.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_steps/upload_note_metadata_step.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_steps/upload_review_step.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_steps/upload_settings_step.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_state.dart';
import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/upload_stage_enum.dart';

class UploadNoteScreen extends ConsumerStatefulWidget {
  const UploadNoteScreen({super.key});

  @override
  ConsumerState<UploadNoteScreen> createState() => _UploadNoteScreenState();
}

class _UploadNoteScreenState extends ConsumerState<UploadNoteScreen> {
  late final notifier = ref.read(uploadProvider.notifier);
  late final upload = ref.watch(uploadProvider);

  final _detailsFormKey = GlobalKey<FormState>();
  final _settingsFormKey = GlobalKey<FormState>();

  void _handleContinue() {
    switch (upload.currentScreen) {
      case UploadScreenEnum.details:
        if (!_detailsFormKey.currentState!.validate()) {
          return;
        }
        break;

      case UploadScreenEnum.settings:
        if (!_settingsFormKey.currentState!.validate()) {
          return;
        }
        break;

      case UploadScreenEnum.review:
        break;
    }

    if (!notifier.validateCurrentStep()) {
      return;
    }
    
    notifier.nextScreen();
  }

  void _handleBackButton() {
    notifier.previousScreen();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final upload = ref.watch(uploadProvider);
    final continueButtonText = upload.currentScreen == UploadScreenEnum.details
        ? "Continue"
        : upload.currentScreen == UploadScreenEnum.settings
        ? "Review Note"
        : upload.currentScreen == UploadScreenEnum.review
        ? "Publish Note"
        : "Continue";
    Widget buildCurrentStep(UploadState state) {
      switch (state.currentScreen) {
        case UploadScreenEnum.details:
          return Form(
            key: _detailsFormKey,
            child: Column(
              children: [
                const UploadFileStep(),
                const SizedBox(height: AppSpacing.xl),
                UploadNoteMetadataStep(),
              ],
            ),
          );

        case UploadScreenEnum.settings:
          return Form(
            key: _settingsFormKey, 
            child: UploadSettingsStep()
          );

        case UploadScreenEnum.review:
          return UploadReviewStep();
      }
    }

    debugPrint("Build whole screen");
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenPadding,
            vertical: AppSpacing.md,
          ),
          child: Column(
            children: [
              UploadProgressIndicator(),
              const SizedBox(height: AppSpacing.lg),
              buildCurrentStep(upload),
              const SizedBox(height: AppSpacing.lg),
              Row(
                spacing: AppSpacing.sm,
                children: [
                  if (upload.currentScreen != UploadScreenEnum.details) ...[
                    Expanded(
                      child: MultiUtilityButton(
                        onPressed: _handleBackButton,
                        text: "Go Back",
                        borderRadius: AppRadius.searchBarRounded,
                        buttonColor: Colors.transparent,
                        buttonTextColor: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                  Expanded(
                    child: MultiUtilityButton(
                      onPressed: _handleContinue,
                      text: continueButtonText,
                      borderRadius: AppRadius.searchBarRounded,
                      buttonColor: theme.colorScheme.primary,
                      buttonTextColor: theme.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
