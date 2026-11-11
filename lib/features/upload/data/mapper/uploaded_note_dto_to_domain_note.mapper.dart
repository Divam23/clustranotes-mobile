import 'package:clustranotes_mobile/features/upload/data/models/uploaded_note_card_dto.dart';
import 'package:clustranotes_mobile/features/upload/data/models/uploaded_note_file_dto.dart';
import 'package:clustranotes_mobile/features/upload/data/models/uploaded_note_stats_dto.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_card.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_file.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_stats.dart';

class UploadedNoteMapper {
  const UploadedNoteMapper._();

  static UploadedNoteCard uploadedNoteCardMapper(UploadedNoteCardDto dto) {
    return UploadedNoteCard(
      id: dto.id,
      title: dto.title,
      subject: dto.subject,
      category: dto.category,
      isPublic: dto.isPublic,
      noteContentType: dto.noteContentType,
      file: uploadedNoteFile(dto.file),
      stats: uploadedNoteStats(dto.stats),
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      notePublishStatus: dto.notePublishStatus,
      noteVerificationStatus: dto.noteVerificationStatus,
      publishedAt: dto.publishedAt,
      submittedForReviewAt: dto.submittedForReviewAt,
      approvedAt: dto.approvedAt,
      rejectedAt: dto.rejectedAt,
      rejectionReason: dto.rejectionReason,
    );
  }

  static UploadedNoteFile uploadedNoteFile(UploadedNoteFileDto dto) {
    return UploadedNoteFile(
      canDownload: dto.canDownload,
      thumbnailUrl: dto.thumbnailUrl,
      pageCount: dto.pageCount,
    );
  }

  static UploadedNoteStats uploadedNoteStats(UploadedNoteStatsDto dto) {
    return UploadedNoteStats(
      viewsCount: dto.viewsCount,
      downloadCount: dto.downloadCount,
      ratingsAverage: dto.ratingsAverage,
      ratingsCount: dto.ratingsCount,
      likesCount: dto.likesCount,
      bookmarksCount: dto.bookmarksCount,
    );
  }
}
