import 'package:clustranotes_mobile/core/widgets/resource_chips/chip_item.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_category_enums.dart';
import 'package:flutter/material.dart';


class AppCategoryChips {
  AppCategoryChips._();

  static const lectureNotes = AppChipItem(
    chipName: "Notes",
    color:  Color(0xFF2196F3),
  );
  
  static const handwritten = AppChipItem(
    chipName: "Handwritten",
    color:  Color(0xFF03A9F4),
  );

  static const revisionNotes = AppChipItem(
    chipName: "Revision Notes",
    color:  Color(0xFF3F51B5),
  );

  static const previousYearQuestions = AppChipItem(
    chipName: "PYQs",
    color:  Color(0xFF9C27B0),
  );

  static const assignment = AppChipItem(
    chipName: "Assignment",
    color:  Color(0xFFFF9800),
  );

  static const labManual = AppChipItem(
    chipName: "Lab Manual",
    color:  Color(0xFF009688),
  );

  static const labRecord = AppChipItem(
    chipName: "Lab Record",
    color:  Color(0xFF4CAF50),
  );

  static const summary = AppChipItem(
    chipName: "Summary",
    color:  Color(0xFFE91E63),
  );

  static const cheatSheet = AppChipItem(
    chipName: "Cheat Sheet",
    color:  Color(0xFFF44336),
  );

  static const presentation = AppChipItem(
    chipName: "Presentation",
    color:  Color(0x43000000),
  );

  static const ebook = AppChipItem(
    chipName: "E-Book",
    color:  Color(0xFF3F51B5),
  );

  static const syllabus = AppChipItem(
    chipName: "Syllabus",
    color: Color(0xFF607D8B),
  );

  static const questionBank = AppChipItem(
    chipName: "Question Bank",
    color: Color(0xFF673AB7),
  );

  static const practiceSet = AppChipItem(
    chipName: "Practice Set",
    color: Color(0xFF00BCD4),
  );

  static const projectReport = AppChipItem(
    chipName: "Project Report",
    color: Color(0xFF795548),
  );

  static const others = AppChipItem(
    chipName: "Others",
    color: Color(0xFF9E9E9E),
  );
}


extension NoteCategoryExtension on NoteCategoryEnum {
  AppChipItem get chip => switch (this) {
    NoteCategoryEnum.lectureNotes => AppCategoryChips.lectureNotes,
    NoteCategoryEnum.handwritten => AppCategoryChips.handwritten,
    NoteCategoryEnum.revisionNotes => AppCategoryChips.revisionNotes,
    NoteCategoryEnum.previousYearQuestions => AppCategoryChips.previousYearQuestions,
    NoteCategoryEnum.assignment => AppCategoryChips.assignment,
    NoteCategoryEnum.labManual => AppCategoryChips.labManual,
    NoteCategoryEnum.labRecord => AppCategoryChips.labRecord,
    NoteCategoryEnum.summary => AppCategoryChips.summary,
    NoteCategoryEnum.cheatSheet => AppCategoryChips.cheatSheet,
    NoteCategoryEnum.presentation => AppCategoryChips.presentation,
    NoteCategoryEnum.ebook => AppCategoryChips.ebook,
    NoteCategoryEnum.syllabus => AppCategoryChips.syllabus,
    NoteCategoryEnum.questionBank => AppCategoryChips.questionBank,
    NoteCategoryEnum.practiceSet => AppCategoryChips.practiceSet,
    NoteCategoryEnum.projectReport => AppCategoryChips.projectReport,
    NoteCategoryEnum.others => AppCategoryChips.others,
  };
}
