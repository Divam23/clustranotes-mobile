import 'package:clustranotes_mobile/features/collection/models/collection_summary_model.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_category_enums.dart';

final dummyCollection = [
  CollectionSummary(
    id: 'co1',
    title: 'Semester 5 Essentials',
    subtitle: 'CSE • Core Subjects',
    type: NoteCategoryEnum.assignment,
    notesCount: 24,
    noteIds: ['n1', 'n2', 'n3'],
  ),
  CollectionSummary(
    id: 'co2',
    title: 'Placement Prep',
    subtitle: 'DSA • Core Concepts',
    type: NoteCategoryEnum.labRecord,
    notesCount: 12,
    noteIds: ['n1', 'n2', 'n3'],
  ),
  CollectionSummary(
    id: 'co3',
    title: 'Last minute revision',
    subtitle: 'CSE • Core Subjects',
    type: NoteCategoryEnum.handwritten,
    notesCount: 23,
    noteIds: ['n1', 'n2', 'n3'],
  ),
  CollectionSummary(
    id: 'co4',
    title: 'DBMS Complete Syllabus',
    subtitle: 'learn dbms from scratch',
    type: NoteCategoryEnum.lectureNotes,
    notesCount: 24,
    noteIds: ['n1', 'n2', 'n3'],
  ),
  CollectionSummary(
    id: 'co5',
    title: 'Semester 5 Essentials',
    subtitle: 'CSE • Core Subjects',
    type: NoteCategoryEnum.practiceSet,
    notesCount: 24,
    noteIds: ['n1', 'n2', 'n3'],
  ),
  
];
