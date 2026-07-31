import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/models/note_content_type_enum.dart';
import 'package:clustranotes_mobile/core/utils/formatters/formatter.dart';
import 'package:clustranotes_mobile/core/widgets/thumbnail/uploaded_note_summary_thumbnail.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdfrx/pdfrx.dart';

class NotePreviewCard extends ConsumerWidget {
  const NotePreviewCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final upload = ref.watch(uploadProvider);
    return Row(
      children: [
        if (upload.uploadFile != null &&
            upload.uploadFile?.contentType == NoteContentType.pdf)
          Container(
            height: 90,
            width: 64,
            decoration: BoxDecoration(
              borderRadius: AppRadius.searchBarSharp,
              border: Border.all(
                width: 1,
                color: theme.disabledColor.withValues(alpha: 0.1),
              ),
            ),
            child: ClipRRect(
              borderRadius: AppRadius.searchBarSharp,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: FutureBuilder<PdfDocument>(
                future: PdfDocument.openFile(upload.uploadFile!.file.path),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return PdfPageView(document: snapshot.data!, pageNumber: 1);
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Icon(
                        AppIcons.note,
                        color: theme.colorScheme.error,
                        size: 24,
                      ),
                    );
                  }
                  return const Center(
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                },
              ),
            ),
          )
        else if (upload.uploadFile?.contentType != null)
          UploadedNoteSummaryThumbnail(
            noteContentType: upload.uploadFile!.contentType,
            borderRadius: AppRadius.searchBarSharp,
            width: 65,
            height: 110,
            fillerColor: theme.colorScheme.surfaceContainer,
          )
        else
          Container(
            height: 110,
            width: 65,
            decoration: BoxDecoration(
              borderRadius: AppRadius.searchBarSharp,
              color: theme.colorScheme.primary.withValues(alpha: 0.2),
            ),
            child: Center(
              child: Icon(
                AppIcons.note,
                color: theme.colorScheme.primary,
                size: 30,
              ),
            ),
          ),
        const SizedBox(width: AppSpacing.lg),
        Expanded(
          child: Column(
            spacing: AppSpacing.md,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                upload.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.headlineSmall,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSpacing.xs,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: theme.disabledColor.withValues(alpha: 0.1),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Wrap(
                      spacing: AppSpacing.itemGap,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppSpacing.xs,
                            horizontal: AppSpacing.sm,
                          ),
                          decoration: BoxDecoration(
                            color: theme.primaryColor.withValues(alpha: 0.2),
                            borderRadius: AppRadius.searchBarSharp,
                          ),
                          child: Text(
                            '${upload.uploadFile?.contentType.toExtension().toString().toUpperCase()}',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: AppColors.primarySky,
                              fontWeight: FontWeight.w800
                            ),
                          ),
                        ),
                    
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppSpacing.xs,
                            horizontal: AppSpacing.sm,
                          ),
                          decoration: BoxDecoration(
                            color: theme.primaryColor.withValues(alpha: 0.2),
                            borderRadius: AppRadius.searchBarSharp,
                          ),
                          child: Text(
                            FileSizeFormatter.format(upload.uploadFile!.sizeInBytes),
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: AppColors.primarySky,
                              fontWeight: FontWeight.w800
                            ),
                          ),
                        ),
                        if (upload.uploadFile?.pageCount != null &&
                            upload.uploadFile!.contentType == NoteContentType.pdf)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppSpacing.xs,
                              horizontal: AppSpacing.sm,
                            ),
                            decoration: BoxDecoration(
                              color: theme.primaryColor.withValues(alpha: 0.2),
                              borderRadius: AppRadius.searchBarSharp,
                            ),
                            child: Text(
                              NumberFormatter.labelWithCount(
                                count: upload.uploadFile!.pageCount!,
                                singularLabel: 'page',
                                pluralLabel: 'pages',
                              ),
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: AppColors.primarySky,
                                fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                        
                        
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.xs,
                      horizontal: AppSpacing.sm,
                    ),
                    child: Text(
                      "✅ Ready to Publish",
                      style: theme.textTheme.labelMedium?.copyWith(
                          color: AppColors.success
                      ),
                    ),
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}
