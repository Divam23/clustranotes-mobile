import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/resource_chips/chip_item.dart';
import 'package:flutter/material.dart';

class AppCategoryChips {
  
  AppCategoryChips._();
  static final lectureNotes = AppChipItem(
    chipName: "Notes",
    radius: AppRadius.chip,
    color: const Color(0xFF2196F3),
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
    color: const Color(0x73000000),
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

  static final Map<String, AppChipItem> allCategories = {
    'lecture_notes': lectureNotes,
    'previous_year_questions': previousYearQuestions,
    'assignment': assignment,
    'lab_manual': labManual,
    'lab_record': labRecord,
    'summary': summary,
    'cheat_sheet': cheatSheet,
    'presentation': presentation,
    'ebook': ebook,
    'syllabus': syllabus,
    'question_bank': questionBank,
    'practice_set': practiceSet,
    'project_report': projectReport,
    'others': others,
  };
}
