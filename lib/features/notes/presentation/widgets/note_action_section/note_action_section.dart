import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

class NoteActionSection extends StatelessWidget {
  const NoteActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.md,
        horizontal: AppSpacing.screenPadding,
      ),
      child: Row(
        spacing: AppSpacing.md,
        children: [
          Expanded(
            child: AppButton(
              text: "Open Note",
              variant: AppButtonVariant.filled,
              onPressed: () {},
            ),
          ),
          Expanded(
            child: AppButton(
              text: "Download",
              variant: AppButtonVariant.outlined,
              onPressed: () {
                print("Download started");
              },
              icon: AppIcons.download,
            ),
          ),
        ],
      ),
    );
  }
}
