import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/chip_item.dart';
import 'package:clustranotes_mobile/features/notes/models/note_enums.dart';
import 'package:flutter/material.dart';

class AppCategoryChips {
  AppCategoryChips._();

  static final lectureNotes = AppChipItem(
    chipName: "Notes",
    radius: AppRadius.chip,
    color: const Color(0xFF2196F3),
  );
  
  static final handwritten = AppChipItem(
    chipName: "Handwritten",
    radius: AppRadius.chip,
    color: const Color(0xFF03A9F4),
  );

  static final revisionNotes = AppChipItem(
    chipName: "Revision Notes",
    radius: AppRadius.chip,
    color: const Color(0xFF3F51B5),
  );

  static final previousYearQuestions = AppChipItem(
    chipName: "PYQs",
    radius: AppRadius.chip,
    color: const Color(0xFF9C27B0),
  );

  static final assignment = AppChipItem(
    chipName: "Assignment",
    radius: AppRadius.chip,
    color: const Color(0xFFFF9800),
  );

  static final labManual = AppChipItem(
    chipName: "Lab Manual",
    radius: AppRadius.chip,
    color: const Color(0xFF009688),
  );

  static final labRecord = AppChipItem(
    chipName: "Lab Record",
    radius: AppRadius.chip,
    color: const Color(0xFF4CAF50),
  );

  static final summary = AppChipItem(
    chipName: "Summary",
    radius: AppRadius.chip,
    color: const Color(0xFFE91E63),
  );

  static final cheatSheet = AppChipItem(
    chipName: "Cheat Sheet",
    radius: AppRadius.chip,
    color: const Color(0xFFF44336),
  );

  static final presentation = AppChipItem(
    chipName: "Presentation",
    radius: AppRadius.chip,
    color: const Color(0x43000000),
  );

  static final ebook = AppChipItem(
    chipName: "E-Book",
    radius: AppRadius.chip,
    color: const Color(0xFF3F51B5),
  );

  static final syllabus = AppChipItem(
    chipName: "Syllabus",
    radius: AppRadius.chip,
    color: const Color(0xFF607D8B),
  );

  static final questionBank = AppChipItem(
    chipName: "Question Bank",
    radius: AppRadius.chip,
    color: const Color(0xFF673AB7),
  );

  static final practiceSet = AppChipItem(
    chipName: "Practice Set",
    radius: AppRadius.chip,
    color: const Color(0xFF00BCD4),
  );

  static final projectReport = AppChipItem(
    chipName: "Project Report",
    radius: AppRadius.chip,
    color: const Color(0xFF795548),
  );

  static final others = AppChipItem(
    chipName: "Others",
    radius: AppRadius.chip,
    color: const Color(0xFF9E9E9E),
  );

  static final Map<NoteCategory, AppChipItem> allCategories = {
    NoteCategory.lectureNotes: lectureNotes,
    NoteCategory.handwritten: handwritten,
    NoteCategory.revisionNotes: revisionNotes,
    NoteCategory.previousYearQuestions: previousYearQuestions,
    NoteCategory.assignment: assignment,
    NoteCategory.labManual: labManual,
    NoteCategory.labRecord: labRecord,
    NoteCategory.summary: summary,
    NoteCategory.cheatSheet: cheatSheet,
    NoteCategory.presentation: presentation,
    NoteCategory.ebook: ebook,
    NoteCategory.syllabus: syllabus,
    NoteCategory.questionBank: questionBank,
    NoteCategory.practiceSet: practiceSet,
    NoteCategory.projectReport: projectReport,
    NoteCategory.others: others,
  };
}


extension NoteCategoryExtension on NoteCategory {
  AppChipItem get chip {
    return AppCategoryChips.allCategories[this] ?? AppCategoryChips.others;
  }
}
