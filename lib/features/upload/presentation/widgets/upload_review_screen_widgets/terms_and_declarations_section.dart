import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_review_screen_widgets/declaration_checkbox.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_review_screen_widgets/review_section_header.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TermsAndDeclarationsSection extends ConsumerWidget {
  const TermsAndDeclarationsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final upload = ref.watch(uploadProvider);
    final notifier = ref.read(uploadProvider.notifier);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: AppRadius.card,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.1),
            offset: Offset(0, 1),
            spreadRadius: 1,
            blurRadius: 1,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: Column(
        spacing: AppSpacing.itemGap,
        children: [
          ReviewSectionHeader(
            icon: AppIcons.shield,
            iconColor: AppColors.warning,
            sectionNumber: 4,
            sectionTitle: "Terms & Declarations",
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: theme.disabledColor.withValues(alpha: 0.1),
                ),
              ),
            ),
            padding: const EdgeInsets.only(
              bottom: AppSpacing.sm
            ),
            child: Column(
              spacing: AppSpacing.md,
              children: [
                DeclarationCheckbox(
                  value: upload.declarations.ownership,
                  onChanged: (ownership) {
                    notifier.updateOwnership(ownership);
                  },
                  statement:
                      "I own this content or have permission to share it.",
                ),

                DeclarationCheckbox(
                  value: upload.declarations.copyright,
                  onChanged: (copyright) {
                    notifier.updateCopyright(copyright);
                  },
                  statement:
                      "This upload does not violate copyright, intellectual property or my institution's policies.",
                ),

                DeclarationCheckbox(
                  value: upload.declarations.guidelines,
                  onChanged: (guidelines) {
                    notifier.updateGuidelines(guidelines);
                  },
                  statement:
                      "I understand Clustra Notes may review, reject, remove or moderate this upload if it violates platform guidelines.",
                ),

                DeclarationCheckbox(
                  value: upload.declarations.consequences,
                  onChanged: (consequences) {
                    notifier.updateConsequences(consequences);
                  },
                  statement:
                      "I understand that repeated submission of misleading, plagiarized or unauthorized material may lead in suspension of my account.",
                ),
              ],
            ),
          ),
          Row(
            spacing: AppSpacing.sm,
            children: [
              Icon(
                AppIcons.lock,
                color: AppColors.warning,
                size: 25
              ),
              Expanded(
                child: Text(
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.dividerColor.withValues(alpha: 0.4)
                  ),
                  "Your privacy matters to us. We never share your personal information. By uploading, you agree to our Terms of Service and Privacy Policy."
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
