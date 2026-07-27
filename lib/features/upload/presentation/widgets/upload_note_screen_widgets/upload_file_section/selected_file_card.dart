import 'package:clustranotes_mobile/app/theme/app_colors.dart';
import 'package:clustranotes_mobile/app/theme/app_radius.dart';
import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/core/models/note_content_type_enum.dart';
import 'package:clustranotes_mobile/core/utils/formatters/formatter.dart';
import 'package:clustranotes_mobile/core/widgets/button/multi_utility_button.dart';
import 'package:clustranotes_mobile/core/widgets/dot.dart';
import 'package:clustranotes_mobile/core/widgets/thumbnail/uploaded_note_summary_thumbnail.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/upload_source_enums.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_state.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_filex/open_filex.dart';

class SelectedFileCard extends ConsumerWidget {
  final UploadState uploadState;
  const SelectedFileCard({
    required this.uploadState,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final upload = ref.watch(uploadProvider);
    final color =
        uploadState.uploadFile?.contentType == NoteContentType.doc ||
            uploadState.uploadFile?.contentType == NoteContentType.docx
        ? theme.colorScheme.primary.withValues(alpha: 0.1)
        : uploadState.uploadFile?.contentType == NoteContentType.ppt ||
            uploadState.uploadFile?.contentType == NoteContentType.pptx
        ? AppColors.warning.withValues(alpha: 0.1)
        : AppColors.error.withValues(alpha: 0.1);
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        dashPattern: [6, 4],
        strokeWidth: 3,
        borderPadding: const EdgeInsets.all(1),
        strokeCap: StrokeCap.butt,
        color: color.withValues(alpha: 0.7),
        radius: Radius.circular(AppRadius.xl),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.sm,
        ),
        decoration: BoxDecoration(borderRadius: AppRadius.card, color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSpacing.sm,
          children: [
            UploadedNoteSummaryThumbnail(
              noteContentType: uploadState.uploadFile!.contentType,
              height: 30,
              width: 30,
              fillerColor: Colors.transparent,
            ),
            Text(
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              uploadState.uploadFile!.fileName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Column(
              spacing: AppSpacing.xs,
              children: [
                Row(
                  spacing: AppSpacing.xs,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.dividerColor.withValues(alpha: 0.6),
                      ),

                      FileSizeFormatter.format(uploadState.uploadFile!.sizeInBytes),
                    ),
                    Dot(radius: AppRadius.xs, color: AppColors.neutral),
                    Text(
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.dividerColor.withValues(alpha: 0.6),
                      ),
                      '${upload.uploadFile?.contentType.toExtension().toString().toUpperCase()}'
                    ),
                    if(uploadState.uploadFile!.pageCount != null)...[
                      Dot(radius: AppRadius.xs, color: AppColors.neutral),
                      Text(
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: theme.dividerColor.withValues(alpha: 0.6),
                        ),
                        NumberFormatter.labelWithCount(
                          count: uploadState.uploadFile!.pageCount!,
                          singularLabel: 'page',
                          pluralLabel: 'pages',
                        ),
                      ),
                    ],
                        
                  ],
                ),
                if (uploadState.uploadFile!.uploadSource == UploadSource.images) ...[
                  Text(
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.dividerColor.withValues(alpha: 0.6),
                    ),
                    textAlign: TextAlign.center,
                    "This pdf file is generated from selected images.",
                  ),
                ],
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                MultiUtilityButton(
                  onPressed: () async{
                    if(!context.mounted) return;
                    await OpenFilex.open(uploadState.uploadFile!.file.path);
                  },
                  text: "Preview File",
                  borderColor: color.withValues(alpha: 1),
                  buttonColor: color,
                  buttonTextColor: color.withValues(alpha: 1),
                ),
                MultiUtilityButton(
                  onPressed: ref.watch(uploadProvider.notifier).removeFile,
                  text: "Remove File",
                  borderColor: color.withValues(alpha: 1),
                  buttonColor: color,
                  buttonTextColor: color.withValues(alpha: 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
