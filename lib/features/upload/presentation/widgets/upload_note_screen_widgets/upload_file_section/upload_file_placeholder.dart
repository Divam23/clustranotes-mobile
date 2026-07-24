import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/button/multi_utility_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class UploadFilePlaceholder extends StatelessWidget {
  final VoidCallback onTap;
  final bool isGeneratingPDF;
  final bool isPickingImages;
  const UploadFilePlaceholder({
    required this.onTap,
    required this.isGeneratingPDF,
    required this.isPickingImages,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        dashPattern: [6, 4],
        strokeWidth: 3,
        borderPadding: const EdgeInsets.all(1),
        strokeCap: StrokeCap.butt,
        color: theme.colorScheme.primaryFixedDim.withValues(alpha: 0.7),
        radius: Radius.circular(AppRadius.xl),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.lg,
            horizontal: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            borderRadius: AppRadius.card,
            color: theme.colorScheme.surfaceContainerLowest,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSpacing.sm,
            children: [
              Icon(
                AppIcons.uploadCloud,
                color: theme.dividerColor.withValues(alpha: 0.5),
                fontWeight: FontWeight(900),
              ),
              Text(
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.dividerColor.withValues(alpha: 0.5),
                  fontWeight: FontWeight.w700,
                ),
                'No file selected',
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.dividerColor.withValues(alpha: 0.6),
                    ),
                    textAlign: TextAlign.center,
                    'PDF, DOC/DOCX, or PPT/PPTX · up to 100 MB',
                  ),
                  Text(
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.dividerColor.withValues(alpha: 0.6),
                    ),
                    textAlign: TextAlign.center,
                    'Upload starts automatically once selected.',
                  ),
                ],
              ),
              isPickingImages == true
                  ? SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: theme.colorScheme.primary.withValues(alpha: 0.6),
                        strokeWidth: AppRadius.xxs,
                        strokeCap: StrokeCap.square,
                      ),
                    )
                  : MultiUtilityButton(onPressed: onTap, text: "Select File", buttonTextColor: theme.hintColor,),
            ],
          ),
        ),
      ),
    );
  }
}
