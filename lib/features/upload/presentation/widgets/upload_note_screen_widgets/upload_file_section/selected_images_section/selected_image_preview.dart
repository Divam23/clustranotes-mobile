import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

class SelectedImagePreview extends StatelessWidget{
  final XFile image;
  const SelectedImagePreview({required this.image, super.key});
  
  @override
  Widget build(BuildContext context){
    return PhotoView(imageProvider: FileImage(File(image.path)));
  }
}
