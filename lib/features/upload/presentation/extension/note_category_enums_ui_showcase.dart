import 'package:clustranotes_mobile/features/notes/models/note_enums.dart';

extension NoteCategoryExtension on NoteCategory {
  String get displayName {
    switch (this) {
      case NoteCategory.lectureNotes:
        return "Lecture Notes";
      case NoteCategory.handwritten:
        return "Handwritten";
      case NoteCategory.previousYearQuestions:
        return "Previous Year Questions";
      case NoteCategory.revisionNotes:
        return "Revision Notes";
      case NoteCategory.assignment:
        return "Assignment";
      case NoteCategory.labManual:
        return "Lab Manual";
      case NoteCategory.labRecord:
        return "Lab Record";
      case NoteCategory.summary:
        return "Summary";
      case NoteCategory.cheatSheet:
        return "Cheat Sheet";
      case NoteCategory.presentation:
        return "Presentation";
      case NoteCategory.ebook:
        return "E-Book";
      case NoteCategory.syllabus:
        return "Syllabus";
      case NoteCategory.questionBank:
        return "Question Bank";
      case NoteCategory.practiceSet:
        return "Practice Set";
      case NoteCategory.projectReport:
        return "Project Report";
      case NoteCategory.others:
        return "Others";
    }
  }
}
