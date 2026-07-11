import 'package:clustranotes_mobile/app/theme/app_radius.dart';
import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/core/widgets/button/multi_utility_button.dart';
import 'package:clustranotes_mobile/features/upload/presentation/pages/upload_note_screen/upload_note_settings_screen.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_metadata_section/academic_details_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_metadata_section/basic_note_details_section.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();
class UploadNoteMetadataSection extends StatelessWidget {
  const UploadNoteMetadataSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.sm,
      children: [
        Text(
          "Metadata",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.start,
        ),
        Form(
          key: _formKey,
          child: Column(
            
            children: [
              BasicNoteDetailsSection(),
              const SizedBox(height: AppSpacing.xxl),
              AcademicDetailsSection(),
              const SizedBox(height: AppSpacing.screenPadding),
              Row(
                children: [
                  Expanded(
                    child: MultiUtilityButton(
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => const UploadNoteSettingsScreen()
                          )
                        );
                      }, 
                      text: "Continue",
                      borderRadius: AppRadius.searchBarRounded,
                      buttonColor: theme.colorScheme.primary,
                      buttonTextColor: theme.colorScheme.onPrimary,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
