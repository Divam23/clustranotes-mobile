import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadNoteReviewScreen extends ConsumerWidget{
  const UploadNoteReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: AppSpacing.lg,),
      ],
    );
  }
}
