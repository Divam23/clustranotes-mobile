import 'package:clustranotes_mobile/features/comments/models/user_summary.dart';

class NoteSummary {
  final String id;
  final String title;
  final String subject;
  final String? thumbnailUrl;

  final UserSummary author;

  final int viewsCount;
  final int downloadsCount;
  final int likesCount;

  final double rating;
  
  final String course;
  final int semester;
  

  const NoteSummary({
    required this.id,
    required this.title,
    required this.subject,
    this.thumbnailUrl,
    required this.author,
    required this.viewsCount,
    required this.downloadsCount,
    required this.likesCount,
    required this.rating,
    required this.course,
    required this.semester,
  });
}
