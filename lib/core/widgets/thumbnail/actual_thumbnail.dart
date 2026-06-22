import 'package:clustranotes_mobile/app/theme/app_radius.dart';
import 'package:flutter/material.dart';

class ActualNoteThumbnail extends StatelessWidget{
  final BorderRadius? borderRadius;
  final String thumbnailUrl;
  const ActualNoteThumbnail({required this.thumbnailUrl, this.borderRadius, super.key});
  
  @override
  Widget build(BuildContext context){
    return ClipRRect(
      borderRadius: borderRadius ?? AppRadius.card,
      child: Image.network(
        thumbnailUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
