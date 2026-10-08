import 'package:clustranotes_mobile/core/api/models/note_content_type_enum.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_category_enums.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_publish_status_enums.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_verification_status_enums.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_card.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_file.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_stats.dart';

final List<UploadedNoteCard> dummyUploadedNoteCards = [
  // 1. Draft - just created, never submitted
  UploadedNoteCard(
    id: 'up001',
    title: 'Data Structures - Linked List Notes',
    subject: 'Data Structures and Algorithms',
    category: NoteCategoryEnum.lectureNotes,
    isPublic: true,
    noteContentType: NoteContentType.pdf,
    file: const UploadedNoteFile(
      pageCount: 14, canDownload: true, thumbnailUrl: '',
    ),
    stats: const UploadedNoteStats(
      downloadCount: 0, 
      viewsCount: 0,
      ratingsAverage: 0,
      ratingsCount: 0,
      likesCount: 0,
      bookmarksCount: 0,
    ),
    createdAt: DateTime(2026, 9, 1),
    updatedAt: null,
    notePublishStatus: NotePublishStatus.draft,
    noteVerificationStatus: NoteVerificationStatus(privateStatus: NoteVerificationPrivateStatus.verified),
    publishedAt: null,
    submittedForReviewAt: null,
    approvedAt: null,
    rejectedAt: null,
    rejectionReason: null,
  ),

  // 2. Submitted, awaiting review
  UploadedNoteCard(
    id: 'up002',
    title: 'Organic Chemistry Reaction Mechanisms',
    subject: 'Organic Chemistry',
    category: NoteCategoryEnum.lectureNotes,
    isPublic: true,
    noteContentType: NoteContentType.pdf,
    file: const UploadedNoteFile(
      pageCount: 26,
      canDownload: true,
      thumbnailUrl: 'https://picsum.photos/seed/up002/400/560',
    ),
    stats: const UploadedNoteStats(
      downloadCount: 0,
      viewsCount: 3,
      ratingsAverage: 0,
      ratingsCount: 0,
      likesCount: 0,
      bookmarksCount: 0,
    ),
    createdAt: DateTime(2026, 9, 10),
    updatedAt: DateTime(2026, 9, 10),
    notePublishStatus: NotePublishStatus.published,
    noteVerificationStatus: NoteVerificationStatus(
      privateStatus: NoteVerificationPrivateStatus.pendingReview,
    ),
    publishedAt: null,
    submittedForReviewAt: DateTime(2026, 9, 10),
    approvedAt: null,
    rejectedAt: null,
    rejectionReason: null,
  ),

  // 3. Approved and live
  UploadedNoteCard(
    id: 'up003',
    title: 'Operating Systems - Scheduling Slides',
    subject: 'Operating Systems',
    category: NoteCategoryEnum.presentation,
    isPublic: true,
    noteContentType: NoteContentType.ppt,
    file: const UploadedNoteFile(
      pageCount: 32,
      canDownload: true,
      thumbnailUrl: 'https://picsum.photos/seed/up003/400/560',
    ),
    stats: const UploadedNoteStats(
      downloadCount: 560,
      viewsCount: 2400,
      ratingsAverage: 4.6,
      ratingsCount: 85,
      likesCount: 120,
      bookmarksCount: 214,
    ),
    createdAt: DateTime(2026, 2, 20),
    updatedAt: DateTime(2026, 2, 27),
    notePublishStatus: NotePublishStatus.published,
    noteVerificationStatus: NoteVerificationStatus(
      privateStatus: NoteVerificationPrivateStatus.verified,
    ),
    publishedAt: DateTime(2026, 2, 27),
    submittedForReviewAt: DateTime(2026, 2, 22),
    approvedAt: DateTime(2026, 2, 26),
    rejectedAt: null,
    rejectionReason: null,
  ),

  // 4. Rejected, with reason, never published
  UploadedNoteCard(
    id: 'up004',
    title: 'Random Lecture Screenshots',
    subject: 'Digital Electronics',
    category: NoteCategoryEnum.lectureNotes,
    isPublic: false,
    noteContentType: NoteContentType.docx,
    file: const UploadedNoteFile(
      pageCount: 5,
      canDownload: false,
      thumbnailUrl: '',
    ),
    stats: const UploadedNoteStats(
      downloadCount: 0,
      viewsCount: 1,
      ratingsAverage: 0,
      ratingsCount: 0,
      likesCount: 0,
      bookmarksCount: 0,
    ),
    createdAt: DateTime(2026, 8, 5),
    updatedAt: DateTime(2026, 8, 7),
    notePublishStatus: NotePublishStatus.published,
    noteVerificationStatus: NoteVerificationStatus(
      privateStatus: NoteVerificationPrivateStatus.rejected,
    ),
    publishedAt: null,
    submittedForReviewAt: DateTime(2026, 8, 5),
    approvedAt: null,
    rejectedAt: DateTime(2026, 8, 7),
    rejectionReason:
    'Content is blurry and partially unreadable. Please re-upload a clearer scan.',
  ),

  // 5. Approved, then made private by the uploader
  UploadedNoteCard(
    id: 'up005',
    title: 'Linear Algebra - Vector Spaces Assignment',
    subject: 'Linear Algebra',
    category: NoteCategoryEnum.assignment,
    isPublic: false,
    noteContentType: NoteContentType.pdf,
    file: const UploadedNoteFile(
      pageCount: 6,
      canDownload: false,
      thumbnailUrl: 'https://picsum.photos/seed/up005/400/560',
    ),
    stats: const UploadedNoteStats(
      downloadCount: 12,
      viewsCount: 40,
      ratingsAverage: 4.0,
      ratingsCount: 3,
      likesCount: 2,
      bookmarksCount: 5,
    ),
    createdAt: DateTime(2026, 6, 15),
    updatedAt: DateTime(2026, 6, 22),
    notePublishStatus: NotePublishStatus.published,
    noteVerificationStatus: NoteVerificationStatus(
      privateStatus: NoteVerificationPrivateStatus.verified,
    ),
    publishedAt: DateTime(2026, 6, 20),
    submittedForReviewAt: DateTime(2026, 6, 16),
    approvedAt: DateTime(2026, 6, 19),
    rejectedAt: null,
    rejectionReason: null,
  ),
];
