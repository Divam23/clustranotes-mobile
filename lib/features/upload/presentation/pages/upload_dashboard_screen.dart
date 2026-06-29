import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/upload/data/uploaded_summary_dummy_data.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/contribution_header/contribution_header.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/my_uploads/my_uploads_section.dart';
import 'package:flutter/material.dart';

class UploadScreen extends StatelessWidget{
  const UploadScreen({super.key});
  
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
                
              ],
            ),
          ),
        )
      ),
      //floatingActionButton: ,
    );
  }
}
