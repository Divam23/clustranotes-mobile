import 'package:clustranotes_mobile/features/notes/domain/enums/note_category_enums.dart';

extension NoteCategoryExtension on NoteCategoryEnum {
  String get displayName {
    switch (this) {
      case NoteCategoryEnum.lectureNotes:
        return "Lecture Notes";
      case NoteCategoryEnum.handwritten:
        return "Handwritten";
      case NoteCategoryEnum.previousYearQuestions:
        return "Previous Year Questions";
      case NoteCategoryEnum.revisionNotes:
        return "Revision Notes";
      case NoteCategoryEnum.assignment:
        return "Assignment";
      case NoteCategoryEnum.labManual:
        return "Lab Manual";
      case NoteCategoryEnum.labRecord:
        return "Lab Record";
      case NoteCategoryEnum.summary:
        return "Summary";
      case NoteCategoryEnum.cheatSheet:
        return "Cheat Sheet";
      case NoteCategoryEnum.presentation:
        return "Presentation";
      case NoteCategoryEnum.ebook:
        return "E-Book";
      case NoteCategoryEnum.syllabus:
        return "Syllabus";
      case NoteCategoryEnum.questionBank:
        return "Question Bank";
      case NoteCategoryEnum.practiceSet:
        return "Practice Set";
      case NoteCategoryEnum.projectReport:
        return "Project Report";
      case NoteCategoryEnum.others:
        return "Others";
    }
  }
}
