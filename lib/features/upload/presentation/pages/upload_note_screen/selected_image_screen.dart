import 'package:clustranotes_mobile/app/theme/app_colors.dart';
import 'package:clustranotes_mobile/app/theme/app_radius.dart';
import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/core/widgets/button/multi_utility_button.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_file_section/selected_images_section/add_more_images_bar_button.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_file_section/selected_images_section/drag_and_reorder_guide_bar.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_file_section/selected_images_section/selected_images_grid.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_file_section/selected_images_section/selected_images_header.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedImageScreen extends ConsumerWidget {
  const SelectedImageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upload = ref.watch(uploadProvider);
    final notifier = ref.read(uploadProvider.notifier);
    final bool isGeneratingPDF = upload.isGeneratingPDF;
    final theme = Theme.of(context);
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          ref.read(uploadProvider.notifier).clearSelectedImages();
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.screenPadding,
              horizontal: AppSpacing.screenPadding,
            ),
            child: Column(
              children: [
                SelectedImagesHeader(uploadState: upload),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: AppSpacing.sectionGap),
                        SelectedImagesGrid(),
                        const SizedBox(height: AppSpacing.sectionGap),
                      ],
                    ),
                  ),
                ),
                   
                DragAndReorderGuideBar(),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  spacing: AppSpacing.sm,
                  children: [
                    Expanded(child: AddMoreImagesBarButton()),
                    Expanded(
                      child: MultiUtilityButton(
                        onPressed: () async{
                          try {
                            await notifier.generatePDF();
                            if (!context.mounted) return;
                            Navigator.pop(context);
                          } catch (e) {
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error generating PDF: $e'),
                              ),
                            );
                          }
                        },
                        text: "Continue",
                        borderColor: AppColors.primarySky,
                        buttonTextColor: AppColors.primarySky,
                        borderRadius: AppRadius.searchBarSharp,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        buttonColor: AppColors.primarySky.withValues(
                          alpha: 0.1,
                        ),
                        child: isGeneratingPDF ? Row(
                          spacing: AppSpacing.xs,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: theme.colorScheme.primary.withValues(alpha: 0.6),
                                  strokeWidth: AppRadius.xxs,
                                  strokeCap: StrokeCap.square,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Generating",
                                style: theme.textTheme.labelLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: AppColors.primarySky
                                )
                              ),
                            )
                          ],
                        )
                        : 
                        Text(
                          "Continue",
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: AppColors.primarySky
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
