import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/upload/data/dummy_dropdown_data.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/common/show_selection_bottom_sheet.dart';
import 'package:clustranotes_mobile/features/upload/presentation/widgets/upload_note_screen_widgets/note_metadata_dropdown.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AcademicDetailsSection extends ConsumerWidget {
  const AcademicDetailsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final upload = ref.watch(uploadProvider);
    final notifier = ref.read(uploadProvider.notifier);

    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.md,
      children: [
        Text(
          "Academic Details",
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          spacing: AppSpacing.lg,
          children: [
            NoteMetadataDropdown<String>(
              label: "University",
              hintText: "Select your university",
              enabled: true,
              value: upload.university,
              itemLabelBuilder: (university) => university,
              onChanged: notifier.updateUniversity,
              allowClear: true,
              onCleared: ()=>notifier.updateUniversity(null),
              picker: (context) async{
                return await showModalBottomSheet(
                  useSafeArea: true,
                  context: context, 
                  isScrollControlled: true,
                  builder: (_)=>
                    ShowSelectionBottomSheet(
                      title: "Select your university", 
                      items: universities,
                      selectedItem: upload.university,
                      labelBuilder: (university) => university, 
                      allowClear: true,
                      hintText: "Which university does this note belong to?",
                    )
                );
              },
            ),
            
            NoteMetadataDropdown<String>(
              label: "College",
              hintText: "Select your college",
              enabled: true,
              value: upload.collegeName,
              itemLabelBuilder: (college) => college,
              onChanged: notifier.updateCollegeName,
              allowClear: true,
              onCleared: ()=>notifier.updateCollegeName(null),
              picker: (context) async{
                return await showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context, 
                  builder: (_){
                    return ShowSelectionBottomSheet(
                      title: "Select your college", 
                      items: colleges,
                      selectedItem: upload.collegeName,
                      labelBuilder: (college) => college, 
                      allowClear: true,
                      hintText: "Search your college here",
                    );
                  }
                );
              },
            ),
            
            NoteMetadataDropdown<String>(
              label: "Course",
              required: true,
              hintText: "B.E / B.Tech. etc.",
              enabled: true,
              value: upload.course,
              itemLabelBuilder: (course) => course,
              onChanged: notifier.updateCourse,
              allowClear: false,
              validator: (value){
                if(value == null ){
                  return "Please select a course";
                }
                return null;
              },
              
              picker: (context) async{
               return await showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context, 
                  builder: (_){
                    return ShowSelectionBottomSheet(
                      title: "Select your course", 
                      items: courses,
                      selectedItem: upload.course,
                      labelBuilder: (course) => course, 
                      hintText: "Search for the desired course",
                    );
                  }
                );
              },
            ),
            
            NoteMetadataDropdown<String>(
              label: "Branch",
              hintText: "Select your branch",
              enabled: true,
              value: upload.branch,
              itemLabelBuilder: (branch) => branch,
              onChanged: notifier.updateBranch,
              allowClear: true,
              onCleared: ()=>notifier.updateBranch(null),
              picker: (context) async{
                return await showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context, 
                  builder: (_){
                    return ShowSelectionBottomSheet(
                      title: "Select your branch", 
                      items: branches,
                      selectedItem: upload.branch,
                      labelBuilder: (branch) => branch, 
                      allowClear: true,
                      hintText: "CSE Computer Science Engineering etc.",
                    );
                  }
                );
              },
            ),
            
            NoteMetadataDropdown<int>(
              label: "Semester",
              hintText: "Select your semester",
              enabled: true,
              value: upload.semester,
              itemLabelBuilder: (semester) => "Semester $semester",
              onChanged: notifier.updateSemester,
              allowClear: true,
              onCleared: ()=>notifier.updateSemester(null),
              picker: (context) async{
                return await showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context, 
                  builder: (_){
                    return ShowSelectionBottomSheet(
                      title: "Select your semester", 
                      items: semesters,
                      selectedItem: upload.semester,
                      labelBuilder: (semester) => "Semester $semester", 
                      allowClear: true,
                      hintText: "What's the semester?",
                    );
                  }
                );
              },
            ),
            
            NoteMetadataDropdown<String>(
              label: "Subject",
              hintText: "Select subject",
              enabled: true,
              value: upload.subject,
              required: true,
              itemLabelBuilder: (subject)=> subject,
              onChanged: notifier.updateSubject,
              allowClear: false,
              validator: (value){
                if(value == null){
                  return "Please choose a subject";
                }
                return null;
              },
              picker: (context) async{
                return await showModalBottomSheet(
                  context: context, 
                  isScrollControlled: true,
                  useSafeArea: true,
                  builder: (_){
                    return ShowSelectionBottomSheet(
                      title: "Select the subject", 
                      items: subjects, 
                      selectedItem: upload.subject,
                      labelBuilder: (subject) => subject,
                      hintText: "Search relevant subject",
                    );
                  }
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
