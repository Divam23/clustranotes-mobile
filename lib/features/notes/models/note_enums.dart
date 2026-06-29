enum NoteCategory {
  lectureNotes,
  handwritten,
  previousYearQuestions,
  revisionNotes,
  assignment,
  labManual,
  labRecord,
  summary,
  cheatSheet,
  presentation,
  ebook,
  syllabus,
  questionBank,
  practiceSet,
  projectReport,
  others,
}

extension NoteCategoryJson on NoteCategory {
  static NoteCategory fromJson(String value) {
    switch (value) {
      case 'lecture_notes':
        return NoteCategory.lectureNotes;
      case 'handwritten':
        return NoteCategory.handwritten;
      case 'revision_notes':
        return NoteCategory.revisionNotes;
      case 'cheat_sheet':
        return NoteCategory.cheatSheet;
      case 'assignment':
        return NoteCategory.assignment;
      case 'lab_manual':
        return NoteCategory.labManual;
      case 'pyq':
        return NoteCategory.previousYearQuestions;
      case 'lab_record':
        return NoteCategory.labRecord;
      case 'summary':
        return NoteCategory.summary;
      case 'presentation':
        return NoteCategory.presentation;
      case 'ebook':
        return NoteCategory.ebook;
      case 'syllabus':
        return NoteCategory.syllabus;
      case 'question_bank':
        return NoteCategory.questionBank;
      case 'practice_set':
        return NoteCategory.practiceSet;
      case 'project_report':
        return NoteCategory.projectReport;
      default:
        return NoteCategory.others;
    }
  }

  String toJson() {
    switch (this) {
      case NoteCategory.lectureNotes:
        return 'lecture_notes';
      case NoteCategory.handwritten:
        return 'handwritten';
      case NoteCategory.revisionNotes:
        return 'revision_notes';
      case NoteCategory.cheatSheet:
        return 'cheat_sheet';
      case NoteCategory.assignment:
        return 'assignment';
      case NoteCategory.labManual:
        return 'lab_manual';
      case NoteCategory.previousYearQuestions:
        return 'pyq';
      case NoteCategory.labRecord:
        return 'lab_record';
      case NoteCategory.summary:
        return 'summary';
      case NoteCategory.presentation:
        return 'presentation';
      case NoteCategory.ebook:
        return 'ebook';
      case NoteCategory.syllabus:
        return 'syllabus';
      case NoteCategory.questionBank:
        return 'question_bank';
      case NoteCategory.practiceSet:
        return 'practice_set';
      case NoteCategory.projectReport:
        return 'project_report';
      case NoteCategory.others:
        return 'other';
    }
  }
}

enum NoteContentType { pdf, docx, pptx, ppt, doc }

extension NoteContentTypeJson on NoteContentType {
  static NoteContentType fromJson(String value) {
    switch (value) {
      case 'doc':
      case 'docx':
        return NoteContentType.docx;
      case 'ppt':
      case 'pptx':
        return NoteContentType.pptx;
      case 'pdf':
        return NoteContentType.pdf;
      default:
        return NoteContentType.pdf;
    }
  }

  String toJson() {
    switch (this) {
      case NoteContentType.pdf:
        return 'pdf';
      case NoteContentType.docx:
        return 'docx';
      case NoteContentType.pptx:
        return 'pptx';
      case NoteContentType.ppt:
        return 'ppt';
      case NoteContentType.doc:
        return 'doc';
    }
  }
}

enum NotePublishStatus { draft, published, archived, removed }

extension NotePublishStatusJson on NotePublishStatus {
  static NotePublishStatus fromJson(String value) {
    switch (value) {
      case 'draft':
        return NotePublishStatus.draft;
      case 'published':
        return NotePublishStatus.published;
      case 'archived':
        return NotePublishStatus.archived;
      case 'removed':
        return NotePublishStatus.removed;
      default:
        return NotePublishStatus.published;
    }
  }

  String toJson() {
    switch (this) {
      case NotePublishStatus.draft:
        return 'draft';
      case NotePublishStatus.published:
        return 'published';
      case NotePublishStatus.archived:
        return 'archived';
      case NotePublishStatus.removed:
        return 'removed';
    }
  }
}

enum NoteVerificationPublicStatus { community, verified }

extension NoteVerificationPublicStatusJson on NoteVerificationPublicStatus {
  static NoteVerificationPublicStatus fromJson(String value) {
    switch (value) {
      case 'community':
        return NoteVerificationPublicStatus.community;
      case 'verified':
        return NoteVerificationPublicStatus.verified;
      default:
        return NoteVerificationPublicStatus.community;
    }
  }

  String toJson() {
    switch (this) {
      case NoteVerificationPublicStatus.community:
        return 'community';
      case NoteVerificationPublicStatus.verified:
        return 'verified';
    }
  }
}


enum NoteVerificationPrivateStatus{
  unverified,
  pendingReview,
  verified,
  rejected
}

extension NoteVerificationPrivateStatusJson on NoteVerificationPrivateStatus {
  static NoteVerificationPrivateStatus fromJson(String value) {
    switch (value) {
      case 'unverified':
        return NoteVerificationPrivateStatus.unverified;
      case 'pending_review':
        return NoteVerificationPrivateStatus.pendingReview;
      case 'verified':
        return NoteVerificationPrivateStatus.verified;
      case 'rejected':
        return NoteVerificationPrivateStatus.rejected;
      default:
        return NoteVerificationPrivateStatus.unverified;
    }
  }

  String toJson() {
    switch (this) {
      case NoteVerificationPrivateStatus.unverified:
        return 'unverified';
      case NoteVerificationPrivateStatus.pendingReview:
        return 'pending_review';
      case NoteVerificationPrivateStatus.verified:
        return 'verified';
      case NoteVerificationPrivateStatus.rejected:
        return 'rejected';
    }
  }
}



