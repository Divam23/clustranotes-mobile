import 'package:clustranotes_mobile/features/notes/models/note_enums.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_upload_step_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/upload_stage_enum.dart';
import 'package:clustranotes_mobile/features/upload/models/upload_file.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
part 'upload_state.freezed.dart';

@freezed
abstract class UploadState with _$UploadState {
  const factory UploadState({
    UploadFile? uploadFile,
    @Default(<XFile>[]) List<XFile> selectedImages,
    @Default("") String title,
    @Default("") String description,

    String? subject,
    String? course,
    String? branch,
    @Default(NoteCategory.lectureNotes) NoteCategory noteCategory,
    @Default(<String>[]) List<String> tags,
    String? collegeName,
    String? university,
    @Default(UploadStep.file) UploadStep currentStep,
    @Default(UploadScreenEnum.details) final UploadScreenEnum currentScreen,
    int? semester,
    int? previewIndex,
    @Default(true) bool isPublic,
    @Default(false) bool isGeneratingPDF,
    @Default(false) bool isPickingDocument,
    @Default(false) bool isUploading,
    String? error,
  })= _UploadState;
}
