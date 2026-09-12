import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter/material.dart';

class UploadProgressScreenHeader extends StatelessWidget{
  const UploadProgressScreenHeader({super.key});
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(AppIcons.uploadCloud),
        Text(
          'Uploading Note',
          maxLines: 2,
          overflow: TextOverflow.visible,
          style: theme.textTheme.displayLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant
          ),
        ),
      ],
    );
  }
}
