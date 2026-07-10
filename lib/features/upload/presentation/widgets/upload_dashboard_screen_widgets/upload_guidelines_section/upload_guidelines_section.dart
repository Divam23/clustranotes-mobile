import 'package:clustranotes_mobile/app/theme/app_colors.dart';
import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_guidelines_section/upload_guidelines_sheet.dart';
import 'package:flutter/material.dart';

void showUploadGuidelines(BuildContext context){
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    enableDrag: true,
    isDismissible: true,
    sheetAnimationStyle: AnimationStyle(duration: Duration(milliseconds: 300)),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(24)
      )
    ),
    builder: (_) => FractionallySizedBox(
      heightFactor: 0.65,
      child: const UploadGuidelinesSheet(),
    ),
  );
}

class UploadGuidelinesSection extends StatelessWidget{
  const UploadGuidelinesSection({super.key});
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Column(
      spacing: AppSpacing.md,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          spacing: AppSpacing.xs,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Upload Guidelines",
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Wrap(
              children: [
                Text(
                  "Follow our guidelines to help us maintain quality content for everyone.",
                  style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onSecondary
                  ),
                ),
              ],
            ),
            
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primarySky.withValues(alpha: 0.2),
          ),
          onPressed: (){
            showUploadGuidelines(context);
          }, 
          child: Text(
            'View Guidelines',
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.primary
            )  
          )
        )
      ],
    );
  }
}
