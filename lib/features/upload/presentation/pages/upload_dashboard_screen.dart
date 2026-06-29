import 'package:clustranotes_mobile/app/theme/app_icons.dart';
import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/core/widgets/button/floating_action_button.dart';
import 'package:clustranotes_mobile/features/upload/data/contribution_stat_data.dart';
import 'package:clustranotes_mobile/features/upload/data/uploaded_summary_dummy_data.dart';
import 'package:clustranotes_mobile/features/upload/presentation/pages/upload_note_screen.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/contribution_header_section/contribution_header.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/contribution_summary_section/contribution_summary_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/my_uploads_section/my_uploads_section.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_guidelines_section/upload_guidelines_section.dart';
import 'package:flutter/material.dart';

class UploadDashboardScreen extends StatefulWidget{
  const UploadDashboardScreen({super.key});

  @override
  State<UploadDashboardScreen> createState() => _UploadDashboardScreenState();
}

class _UploadDashboardScreenState extends State<UploadDashboardScreen> {
  late final contribution = dummyContributionStats;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.screenPadding),
            child: Column(
              children: [
                const ContributionHeader(),
                const SizedBox(height: AppSpacing.itemGap,),
                MyUploadSection(uploadedNotecards: dummyUploadedNotes,),
                const SizedBox(height: AppSpacing.itemGap,),
                ContributionSummarySection(contribution: contribution,),
                const SizedBox(height: AppSpacing.sectionGap,),
                UploadGuidelinesSection(),
                const SizedBox(height: AppSpacing.screenPadding,)
              ],
            ),
          ),
        )
      ),
      floatingActionButton: AppFloatingActionButton(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const UploadNoteScreen()));
      },),
    );
  }
}
