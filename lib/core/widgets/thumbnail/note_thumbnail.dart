import 'package:clustranotes_mobile/core/widgets/thumbnail/actual_thumbnail.dart';
import 'package:clustranotes_mobile/core/widgets/thumbnail/default_thumbnail.dart';
import 'package:flutter/material.dart';

class NoteThumbnail extends StatelessWidget{
  final String? thumbnailUrl;
  final String contentType;
  final BorderRadius? borderRadius;
  const NoteThumbnail({required this.contentType, this.thumbnailUrl, this.borderRadius, super.key});
  
  @override
  Widget build(BuildContext context){
    return thumbnailUrl != null && thumbnailUrl!.isNotEmpty ? ActualNoteThumbnail(thumbnailUrl: thumbnailUrl!, borderRadius: borderRadius,) : DefaultNoteThumbnail(contentType: contentType, borderRadius: borderRadius,);
  }
}
