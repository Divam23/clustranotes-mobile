import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/upload_file_section/selected_images_section/selected_image_tile.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class SelectedImagesGrid extends ConsumerStatefulWidget{
  const SelectedImagesGrid({super.key});

  @override
  ConsumerState<SelectedImagesGrid> createState() => _SelectedImagesGridState();
}

class _SelectedImagesGridState extends ConsumerState<SelectedImagesGrid> {
  @override
  Widget build(BuildContext context){
    final upload = ref.watch(uploadProvider);
    final isLandscape = MediaQuery.orientationOf(context) == Orientation.landscape;
    return ReorderableGridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: upload.selectedImages.length,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isLandscape ? 4 : 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 15,
        childAspectRatio: isLandscape ? 0.6 : 0.6,
      ),
      onReorder: (oldIndex, newIndex){
        if(oldIndex < newIndex){
          newIndex -=1;
        }
        ref.read(uploadProvider.notifier).reorderImages(oldIndex, newIndex);
      },
      itemBuilder: (context, index){
        final image = upload.selectedImages[index];
        return SelectedImageTile(
          key: ValueKey(image),
          index:index,
          image: image,
        );
        
      },
    );
  }
}
