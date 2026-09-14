import 'package:clustranotes_mobile/features/user/domain/models/user_summary.dart';

class NoteSummary {
  final String id;
  final String title;
  final String? description;
  final String subject;
  final String? thumbnailUrl;

  final UserSummary uploader;

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
    this.description,
    this.thumbnailUrl,
    required this.uploader,
    required this.viewsCount,
    required this.downloadsCount,
    required this.likesCount,
    required this.rating,
    required this.course,
    required this.semester,
  });
}
