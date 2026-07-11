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
    
    final upload = ref.read(uploadProvider);
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
              onTap: () {
                showModalBottomSheet(
                  useSafeArea: true,
                  context: context, 
                  isScrollControlled: true,
                  builder: (_){
                    return ShowSelectionBottomSheet(
                      title: "Select your university", 
                      items: universities,
                      selectedItem: upload.university,
                      labelBuilder: (university) => university, 
                      onSelected: notifier.updateUniversity,
                      allowClear: true,
                      onClear: () => notifier.updateUniversity(null),
                      hintText: "Which university does this note belong to?",
                    );
                  }
                );
              },
            ),
            
            NoteMetadataDropdown<String>(
              label: "College",
              hintText: "Select your college",
              enabled: true,
              value: upload.collegeName,
              itemLabelBuilder: (college) => college,
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context, 
                  builder: (_){
                    return ShowSelectionBottomSheet(
                      title: "Select your college", 
                      items: colleges,
                      selectedItem: upload.collegeName,
                      labelBuilder: (college) => college, 
                      onSelected: notifier.updateCollegeName,
                      allowClear: true,
                      onClear: () => notifier.updateCollegeName(null),
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
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context, 
                  builder: (_){
                    return ShowSelectionBottomSheet(
                      title: "Select your course", 
                      items: courses,
                      selectedItem: upload.course,
                      labelBuilder: (course) => course, 
                      onSelected: notifier.updateCourse,
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
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context, 
                  builder: (_){
                    return ShowSelectionBottomSheet(
                      title: "Select your branch", 
                      items: branches,
                      selectedItem: upload.branch,
                      labelBuilder: (branch) => branch, 
                      onSelected: notifier.updateBranch,
                      allowClear: true,
                      onClear: () => notifier.updateBranch(null),
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
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context, 
                  builder: (_){
                    return ShowSelectionBottomSheet(
                      title: "Select your branch", 
                      items: semesters,
                      selectedItem: upload.semester,
                      labelBuilder: (semester) => "Semester $semester", 
                      onSelected: notifier.updateSemester,
                      allowClear: true,
                      onClear: () => notifier.updateSemester(null),
                      hintText: "What's your semester?",
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
              itemLabelBuilder: (subject)=> subject,
              onTap: (){
                showModalBottomSheet(
                  context: context, 
                  isScrollControlled: true,
                  useSafeArea: true,
                  builder: (_){
                    return ShowSelectionBottomSheet(
                      title: "Select the subject", 
                      items: subjects, 
                      selectedItem: upload.subject,
                      labelBuilder: (subject) => subject,
                      onSelected: notifier.updateSubject,
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
