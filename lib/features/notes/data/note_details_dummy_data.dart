import 'package:clustranotes_mobile/features/notes/models/note_model.dart';
import '../models/note_file.dart';
import '../models/note_stats.dart';

final List<Note> dummyNotes = [
  Note(
    id: '1',
    title: 'Database Management Systems Complete Notes',
    description:
    'Comprehensive notes covering ER Models, SQL, Transactions and Normalization. Comprehensive notes covering ER Models, SQL, Transactions and Normalization.Comprehensive notes covering ER Models, SQL, Transactions and Normalization.Comprehensive notes covering ER Models, SQL, Transactions and Normalization.Comprehensive notes covering ER Models, SQL, Transactions and Normalization.Comprehensive notes covering ER Models, SQL, Transactions and Normalization.Comprehensive notes covering ER Models, SQL, Transactions and Normalization.Comprehensive notes covering ER Models, SQL, Transactions and Normalization.Comprehensive notes covering ER Models, SQL, Transactions and Normalization.Comprehensive notes covering ER Models, SQL, Transactions and Normalization.Comprehensive notes covering ER Models, SQL, Transactions and Normalization.Comprehensive notes covering ER Models, SQL, Transactions and Normalization.Comprehensive notes covering ER Models, SQL, Transactions and Normalization.Comprehensive notes covering ER Models, SQL, Transactions and Normalization.Comprehensive notes covering ER Models, SQL, Transactions and Normalization.Comprehensive notes covering ER Models, SQL, Transactions and Normalization.',
    subject: 'DBMS',
    category: 'lecture_notes',
    contentType: 'pdf',
    tags: ['DBMS', 'Semester 5', 'Notes'],
    course: 'B.Tech CSE',
    university: 'IIT Dhanbad',
    semester: 5,
    language: 'English',

    file: NoteFile(
      url: 'https://example.com/dbms.pdf',
      mimeType: 'application/pdf',
      thumbnailUrl:
      'https://images.unsplash.com/photo-1516321318423-f06f85e504b3',
      pageCount: 45,
      readingTime: 120,
      sizeInBytes: 2457600,
    ),

    uploaderId: 'u1',
    uploaderName: 'Arjun Patel',
    uploaderAvatar:
    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',

    isPublic: true,
    status: 'published',
    isVerifiedNote: true,
    noteVerificationStatus: NoteVerificationStatus.verified,

    stats: NoteStats(
      viewsCount: 2500,
      downloadCount: 1200,
      likesCount: 340,
      bookmarksCount: 85,
      commentsCount: 26,
    ),

    publishedAt: DateTime.now(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    
  ),

  Note(
    id: '2',
    title: 'Computer Networks Mid Semester Notes',
    description:
    'Important concepts for mid semester examinations including OSI and TCP/IP.',
    subject: 'Computer Networks',
    category: 'assignment',
    contentType: 'pptx',
    tags: ['CN', 'Semester 5'],

    course: 'B.Tech CSE',
    university: 'IIT Dhanbad',
    semester: 5,
    language: 'English',

    file: NoteFile(
      url: 'https://example.com/cn.pdf',
      mimeType: 'application/pdf',
      thumbnailUrl:
      'https://images.unsplash.com/photo-1515879218367-8466d910aaa4',
      pageCount: 32,
      readingTime: 90,
    ),

    uploaderId: 'u2',
    uploaderName: 'Priya Sharma',

    isPublic: true,
    status: 'published',
    noteVerificationStatus: NoteVerificationStatus.community,
    isVerifiedNote: true,

    stats: NoteStats(
      viewsCount: 1800,
      downloadCount: 650,
      likesCount: 140,
      bookmarksCount: 44,
      commentsCount: 12,
    ),

    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
];
