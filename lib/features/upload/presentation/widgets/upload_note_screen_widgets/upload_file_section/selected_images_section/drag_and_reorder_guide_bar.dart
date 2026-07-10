import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_file_section/selected_images_section/drag_dots.dart';
import 'package:flutter/material.dart';

class DragAndReorderGuideBar extends StatelessWidget{
  const DragAndReorderGuideBar({super.key});
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(color: AppColors.primarySky),
        color: AppColors.primarySky.withValues(alpha: 0.1)
      ),
      child: Row(
        spacing: AppSpacing.xs,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DragDots(),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Tap and hold the handle (",
                    style: theme.textTheme.labelLarge,
                  ),
                  const WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(
                      AppIcons.hamburger,
                      size: 18,
                    ),
                  ),
                  TextSpan(
                    text: ") and drag to reorder pages.",
                    style: theme.textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
