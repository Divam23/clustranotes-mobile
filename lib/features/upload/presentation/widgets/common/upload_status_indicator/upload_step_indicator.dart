import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_upload_step_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_upload_step_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/common/upload_status_indicator/upload_step_indicator_item.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadProgressIndicator extends ConsumerWidget {
  const UploadProgressIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upload = ref.watch(uploadProvider);
    final notifier = ref.read(uploadProvider.notifier);
    const circleSize = 28.0;
    const connectorLength = 35.0;
    var indicatorWidth = 0.0;
    final theme = Theme.of(context);
    final children = <Widget>[];
    final steps = [
      ("File", UploadStep.file),
      ("Details", UploadStep.basicDetails),
      ("Settings", UploadStep.noteSettings),
      ("Review", UploadStep.review),
    ];
    for (int step = 0; step < steps.length; step++) {
      final uploadStep = steps[step].$2;

      final stepStatus = switch (uploadStep) {
        UploadStep.file => notifier.getFileStatus(),
        UploadStep.basicDetails => notifier.getDetailsStatus(),
        UploadStep.noteSettings => notifier.getSettingsStatus(),
        UploadStep.review => notifier.getReviewStatus(),
      };

      final status = uploadStep.index > upload.currentStep.index
          ? NoteUploadStepStatusEnum.upcoming
          : stepStatus;
      
      indicatorWidth =
          (circleSize * steps.length) + (connectorLength * (steps.length - 1));
      
      children.add(
        UploadStepIndicatorItem(
          isLastStep: step == steps.length - 1,
          isCompleted: status == NoteUploadStepStatusEnum.completed,
          stepNumber: step + 1,
          stepStatus: status,
        ),
      );
    }
    return SizedBox(
      width: indicatorWidth,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
          const SizedBox(height: AppSpacing.xs),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: steps.map((step) {
              return Expanded(
                child: Center(
                  child: Text(
                    step.$1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.labelSmall,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
