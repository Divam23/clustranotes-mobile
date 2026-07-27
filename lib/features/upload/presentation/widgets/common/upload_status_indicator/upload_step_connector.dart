import 'package:flutter/material.dart';

class UploadStepConnector extends StatelessWidget {
  final bool isCompleted;

  const UploadStepConnector({
    required this.isCompleted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 3,
      width: 35,
      color: isCompleted
          ? theme.colorScheme.primary
          : theme.disabledColor,
    );
  }
}
