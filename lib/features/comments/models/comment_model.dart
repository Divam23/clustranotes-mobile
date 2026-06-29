import 'package:clustranotes_mobile/features/user/models/user_summary.dart';

class Comment {
  final String id;
  final String noteId;
  final UserSummary user;
  final UserSummary? replyingToUser;
  final String content;
  final String? parentCommentId;
  final bool isLiked;
  final int likesCount;
  final int repliesCount;
  final bool isEdited;
  final DateTime createdAt;

  const Comment({
    required this.id,
    required this.noteId,
    required this.user,
    this.replyingToUser,
    required this.content,
    this.parentCommentId,
    required this.likesCount,
    required this.isLiked,
    required this.repliesCount,
    required this.isEdited,
    required this.createdAt,
  });
}
