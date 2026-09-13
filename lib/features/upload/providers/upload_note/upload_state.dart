import 'package:clustranotes_mobile/core/errors/app_failure.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_category_enums.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_upload_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_upload_step_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/upload_stage_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/upload_declarations_model.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/upload_file.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
part 'upload_state.freezed.dart';

@freezed
abstract class UploadState with _$UploadState {
  @Assert('uploadProgress <= 1.0', 'Upload progress cannot exceed 1.0')
  const factory UploadState({
    UploadFile? uploadFile,
    @Default(<XFile>[]) List<XFile> selectedImages,
    @Default("") String title,
    @Default("") String description,

    String? subject,
    String? course,
    String? branch,
    @Default(NoteCategoryEnum.lectureNotes) NoteCategoryEnum noteCategory,
    @Default(<String>[]) List<String> tags,
    String? collegeName,
    String? university,
    @Default("en") String language,
    @Default(UploadStep.file) UploadStep currentStep,
    @Default(UploadScreenEnum.details) final UploadScreenEnum currentScreen,
    int? semester,
    int? previewIndex,
    @Default(true) bool isPublic,
    @Default(false) bool isGeneratingPDF,
    @Default(false) bool isPickingDocument,
    @Default(true) bool canDownload,
    @Default(0.0) double uploadProgress,
    @Default(NoteUploadStatus.idle) NoteUploadStatus noteUploadStatus,
    @Default(UploadDeclarations()) UploadDeclarations declarations, 
    AppFailure? error,
  })= _UploadState;
}
