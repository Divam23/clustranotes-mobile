import 'package:clustranotes_mobile/features/notes/data/models/create_note_response_dto.dart';
import 'package:clustranotes_mobile/features/notes/models/note_file_metadata.dart';
import 'package:clustranotes_mobile/features/notes/models/note_model.dart';
import 'package:clustranotes_mobile/features/notes/models/note_stats.dart';
import 'package:clustranotes_mobile/features/user/domain/models/user_avatar.dart';
import 'package:clustranotes_mobile/features/user/domain/models/user_summary.dart';

class NoteMapper{
  const NoteMapper._();
  static Note createNoteResponseToNote(CreateNoteResponseDto dto) {
    return Note(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      subject: dto.subject,
      category: dto.category,
      branch: dto.branch,
      tags: dto.tags,
      collegeName: dto.college,
      university: dto.university,
      semester: dto.semester,
      contentType: dto.contentType,
      course: dto.course,
      language: dto.language,
      uploader: UserSummary(
        id: dto.uploader.id,
        firstName: dto.uploader.firstName,
        lastName: dto.uploader.lastName,
        userName: dto.uploader.userName,
        avatar: UserAvatarModel(
          url: dto.uploader.avatar.url,
          storagePath: dto.uploader.avatar.storagePath,
        ),
        userVerificationStatus: dto.uploader.userVerificationStatus,
      ),
      file: NoteFileMetadata(
        mimeType: dto.file.mimeType,
        sizeInBytes: dto.file.size,
        pageCount: dto.file.pageCount,
        readingTime: dto.file.readingTime,
        thumbnailUrl: dto.file.thumbnailUrl,
      ),
      isPublic: dto.isPublic,
      publishStatus: dto.notePublishStatus,
      noteVerificationStatus: dto.noteVerificationPublicStatus,
      stats: NoteStats(
        viewsCount: dto.stats.viewsCount,
        downloadCount: dto.stats.downloadCount,
        likesCount: dto.stats.likesCount,
        bookmarksCount: dto.stats.bookmarksCount,
        commentsCount: 0,
        ratingsCount: dto.stats.ratingsCount,
        ratingsAverage: dto.stats.ratingsAverage,
        lastViewedAt: null,
      ),
      publishedAt: dto.publishedAt,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}


