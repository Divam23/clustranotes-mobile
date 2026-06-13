import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/core/widgets/search_bar.dart';
import 'package:clustranotes_mobile/features/home/presentation/widgets/academic_header.dart';
import 'package:clustranotes_mobile/features/home/presentation/widgets/latest_upload/latest_uploads_section.dart';
import 'package:clustranotes_mobile/features/home/presentation/widgets/quick_access_card.dart';
import 'package:clustranotes_mobile/features/home/presentation/widgets/recently_opened_card.dart';
import 'package:clustranotes_mobile/features/home/presentation/widgets/recommended_section/recommended_section.dart';
import 'package:clustranotes_mobile/features/home/presentation/widgets/semester_context_card.dart';
import 'package:clustranotes_mobile/features/search/presentation/pages/search_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.screenPadding),
            child: Column(
              children: [
                const AcademicHeader(),
                const SizedBox(height: AppSpacing.itemGap,),
                AppSearchBar(
                  readOnly: true,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> const SearchScreen())
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.itemGap,),
                const SemesterContextCard(),
                const SizedBox(height: AppSpacing.sectionGap,),
                const RecentlyOpenedCard(),
                const SizedBox(height: AppSpacing.sectionGap,),
                const QuickAccessCards(),
                const SizedBox(height: AppSpacing.sectionGap,),
                const RecommendedSection(),
                const SizedBox(height: AppSpacing.sectionGap,),
                const LatestUploads(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
