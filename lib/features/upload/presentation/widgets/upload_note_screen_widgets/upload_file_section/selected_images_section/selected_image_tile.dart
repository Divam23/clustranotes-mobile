import 'dart:io';
import 'package:clustranotes_mobile/app/theme/app_icons.dart';
import 'package:clustranotes_mobile/app/theme/app_radius.dart';
import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_file_section/selected_images_section/selected_image_preview.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class SelectedImageTile extends ConsumerWidget {
  final int index;
  final XFile image;
  const SelectedImageTile({
    required this.image,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final notifier = ref.read(uploadProvider.notifier);
    final isLandscape = MediaQuery.orientationOf(context) == Orientation.landscape;
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppRadius.card,
        border: Border.all(color: theme.disabledColor.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              if(!notifier.mounted) return;
              Navigator.push(context, MaterialPageRoute(builder: (_)=> SelectedImagePreview(image: image)));
            },
            child: AspectRatio(
              aspectRatio: isLandscape ? 0.75: 0.76,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      border: Border(
                        bottom: BorderSide(
                          color: theme.dividerColor.withValues(alpha: 0.3),
                        ),
                      ),
                      borderRadius: AppRadius.card.copyWith(
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                      )
                    ),
                    child: ClipRRect(
                      borderRadius: AppRadius.card.copyWith(
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
              
                      child: Center(
                        child: Image.file(
                          File(image.path),
                          fit: BoxFit.cover,
                          cacheWidth: 300,
                          cacheHeight: 300,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: AppSpacing.xs,
                    right: AppSpacing.xs,
                    child: Material(
                      elevation: 3,
                      color: theme.colorScheme.onPrimary,
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () {
                          notifier.removeImageAt(index);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(AppSpacing.sm),
                          child: Icon(
                            AppIcons.close,
                            size: 18,
                            color: theme.colorScheme.scrim,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
            child: Row(
              spacing: AppSpacing.sm,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: AppRadius.searchBarSharp,
                  ),
                  child: Center(child: Text('${index + 1}', style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onPrimary
                  ))),
                ),
                Expanded(
                  child: Text(
                    'Page ${index + 1}',
                    style: theme.textTheme.titleSmall,
                  )
                ),
                ReorderableDragStartListener(
                  index: index,
                  child: Icon(AppIcons.hamburger),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
