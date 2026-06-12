import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/home/presentation/widgets/academic_header.dart';
import 'package:clustranotes_mobile/features/home/presentation/widgets/latest_upload/latest_uploads_section.dart';
import 'package:clustranotes_mobile/features/home/presentation/widgets/quick_access_card.dart';
import 'package:clustranotes_mobile/features/home/presentation/widgets/recently_opened_card.dart';
import 'package:clustranotes_mobile/features/home/presentation/widgets/recommended_section/recommended_section.dart';
import 'package:clustranotes_mobile/features/home/presentation/widgets/search_bar_widget.dart';
import 'package:clustranotes_mobile/features/home/presentation/widgets/semester_context_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: const [
                AcademicHeader(),
                SizedBox(height: AppSpacing.itemGap,),
                AppSearchBar(),
                SizedBox(height: AppSpacing.itemGap,),
                SemesterContextCard(),
                SizedBox(height: AppSpacing.sectionGap,),
                RecentlyOpenedCard(),
                SizedBox(height: AppSpacing.sectionGap,),
                QuickAccessCards(),
                SizedBox(height: AppSpacing.sectionGap,),
                RecommendedSection(),
                SizedBox(height: AppSpacing.sectionGap,),
                LatestUploads(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
