import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_upload_step_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/common/upload_status_indicator/upload_step_connector.dart';
import 'package:flutter/material.dart';

class UploadStepIndicatorItem extends StatelessWidget {
  final bool isCompleted;
  final bool isLastStep;
  final int stepNumber;
  final NoteUploadStepStatusEnum stepStatus;
  const UploadStepIndicatorItem({
    required this.isCompleted,
    required this.isLastStep,
    required this.stepNumber,
    required this.stepStatus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget circleChild;
    Color circleColor;

    switch (stepStatus) {
      case NoteUploadStepStatusEnum.completed:
        circleColor = theme.colorScheme.primary;
        circleChild = Center(
          child: Icon(
            AppIcons.tickMark,
            size: 12,
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight(900),
          ),
        );
        break;
      case NoteUploadStepStatusEnum.inProgress:
        circleColor = theme.colorScheme.primary;
        circleChild = Center(
          child: Text('$stepNumber', style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onPrimary
          )),
        );
        break;
      case NoteUploadStepStatusEnum.upcoming:
        circleColor = theme.disabledColor;
        circleChild = Center(
          child: Text('$stepNumber', style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onPrimary
          )),
        );
        break;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: circleColor
          ),
          child: circleChild,
          
        ),
        if (!isLastStep)
          UploadStepConnector(isCompleted: isCompleted,)
      ],
    );
  }
}
