import 'package:clustranotes_mobile/app/theme/app_colors.dart';
import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/upload/models/contribution_stats_model.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/contribution_summary_section/contribution_summary_stats_card.dart';
import 'package:flutter/material.dart';

class ContributionSummarySection extends StatelessWidget{
  final ContributionStatsModel contribution; 
  const ContributionSummarySection({required this.contribution, super.key});
  
  @override
  Widget build(BuildContext context){
    final stats = [
      ContributionStatCardModel(
          stat: contribution.totalNotesCount,
          label: 'Total Notes',
          color: AppColors.primary
      ),
      ContributionStatCardModel(
          stat: contribution.verifiedNotesCount,
          label: 'Verified Notes',
          color: AppColors.success
      ),
      ContributionStatCardModel(
          stat: contribution.pendingReviewNotesCount,
          label: 'Pending Review',
          color: AppColors.warning
      ),
      ContributionStatCardModel(
          stat: contribution.totalViewsCount,
          label: 'Total Views',
          color: AppColors.info
      ),
      ContributionStatCardModel(
          stat: contribution.totalLikesCount,
          label: 'Total Likes',
          color: AppColors.notificationBadge
      ),
      ContributionStatCardModel(
          stat: contribution.totalDownloadsCount,
          label: 'Total Downloads',
          color: AppColors.primarySky
      ),
    ];
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "Contribution Summary",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text("See All"),
            ),
          ],
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: stats.length,
          itemBuilder: (context, index) {
            final stat = stats[index];
            return ContributionStatsCard(card: stat);
          }, 
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.md,
            childAspectRatio: 2,
          ),
          
        )
      ],
    );
  }
}
