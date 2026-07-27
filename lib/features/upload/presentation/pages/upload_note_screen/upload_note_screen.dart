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

  final _detailsFormKey = GlobalKey<FormState>();
  final _settingsFormKey = GlobalKey<FormState>();
  final _reviewFormKey = GlobalKey<FormState>();

  void _handleContinue() {
    final upload = ref.watch(uploadProvider);
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
        if (!_reviewFormKey.currentState!.validate()) {
          return;
        }
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
    final continueButtonText = switch (upload.currentScreen) {
      UploadScreenEnum.details => "Continue",
      UploadScreenEnum.settings => "Review Note",
      UploadScreenEnum.review => "Publish Note",
      _ => "Continue",
    };
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
          return Form(key: _settingsFormKey, child: UploadSettingsStep());

        case UploadScreenEnum.review:
          return Form(key: _reviewFormKey, child: UploadReviewStep(),);
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenPadding,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          spacing: AppSpacing.sm,
          children: [
            if (upload.currentScreen != UploadScreenEnum.details) ...[
              Expanded(
                child: MultiUtilityButton(
                  onPressed: _handleBackButton,
                  text: "",
                  borderRadius: AppRadius.searchBarRounded,
                  buttonColor: theme.colorScheme.onInverseSurface,
                  buttonTextColor: theme.colorScheme.primary,
                  elevation: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        AppIcons.leftArrow,
                        size: 20,
                        color: theme.colorScheme.primary,
                      ),
                      Text(
                        "Back",
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      )
                    ],
                  ),
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
                elevation: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
