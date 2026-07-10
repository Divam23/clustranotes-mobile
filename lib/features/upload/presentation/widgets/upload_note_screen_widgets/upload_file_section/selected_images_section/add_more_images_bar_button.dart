import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddMoreImagesBarButton extends ConsumerWidget{
  const AddMoreImagesBarButton({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref){
    final theme = Theme.of(context);
    return InkWell(
      onTap: (){
        ref.read(uploadProvider.notifier).addImages();
      },
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            border: Border.all(color: AppColors.primarySky),
            color: AppColors.primarySky.withValues(alpha: 0.1)
        ),
        child: Row(
          spacing: AppSpacing.sm,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              AppIcons.plus,
              fontWeight: FontWeight(700),
              color: AppColors.primarySky,
            ),
            Text(
              "Add More Images",
              textAlign: TextAlign.center,
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.primarySky,
              ),
            )
          ],
        ),
      ),
    );
  }
}
