import 'dart:io';
import 'package:clustranotes_mobile/core/errors/app_failure.dart';
import 'package:clustranotes_mobile/core/errors/app_failure_mapper.dart';
import 'package:clustranotes_mobile/core/errors/exceptions/app_exception.dart';
import 'package:clustranotes_mobile/core/models/note_content_type_enum.dart';
import 'package:clustranotes_mobile/features/notes/data/models/create_note_dto.dart';
import 'package:clustranotes_mobile/features/notes/domain/enums/note_category_enums.dart';
import 'package:clustranotes_mobile/features/notes/domain/repositories/note_repository.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_upload_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_upload_step_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_upload_step_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/upload_source_enums.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/upload_stage_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/upload_file.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_note/upload_state.dart';
import 'package:clustranotes_mobile/features/upload/services/images_to_pdf_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdfrx/pdfrx.dart';

class UploadNotifier extends StateNotifier<UploadState> {
  final NoteRepository _noteRepository;
  UploadNotifier(this._noteRepository) : super(const UploadState());

  static const maxTagLength = 10;
  static const maxFileSize = 100 * 1024 * 1024; // 100 MB

  Future<void> pickImages() async {
    if (!mounted) return;
    state = state.copyWith(isPickingDocument: true, error: null);
    final images = await ImagePicker().pickMultiImage();
    if (images.isEmpty) {
      state = state.copyWith(isGeneratingPDF: false, isPickingDocument: false);
      return;
    }

    state = state.copyWith(
      selectedImages: images,
      uploadFile: null,
      isPickingDocument: false,
      error: null,
    );
  }

  Future<void> pickDocument() async {
    try {
      if (!mounted) return;
      state = state.copyWith(isPickingDocument: true, error: null);
      final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: NoteContentType.values
            .map((e) => e.toExtension())
            .toList(),
      );
      if (result == null) {
        state = state.copyWith(isPickingDocument: false);
        return;
      }

      final pickedFile = result.files.single;
      if (pickedFile.path == null || pickedFile.extension == null) {
        throw Exception('Invalid file selected.');
      }
      if (pickedFile.size > maxFileSize) {
        throw Exception("File size exceeded (max. 100 MB)");
      }
      final file = File(pickedFile.path!);
      final fileExtension = NoteContentTypeJson.fromExtension(
        pickedFile.extension!,
      );

      int? pageCount;

      if (fileExtension == NoteContentType.pdf) {
        pageCount = await _getPdfPageCount(file.path);
      }
      final uploadFile = UploadFile(
        file: file,
        contentType: fileExtension,
        sizeInBytes: await file.length(),
        uploadSource: UploadSource.file,
        pageCount: pageCount,
        selectedImages: null,
      );
      state = state.copyWith(
        uploadFile: uploadFile,
        currentStep: UploadStep.basicDetails,
        error: null,
      );
    } on AppException catch (exception) {
      if (!mounted) return;
      state = state.copyWith(error: AppFailureMapper.map(exception));
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      debugPrint("Error in picking file: $error");
      if (!mounted) return;
      state = state.copyWith(
        error: const AppFailure(
          message: 'Something went wrong while picking file. Please try again.',
          retryable: true,
        ),
      );
    } finally {
      if (mounted) {
        state = state.copyWith(isPickingDocument: false);
      }
    }
  }

  Future<void> addImages() async {
    final newImages = await ImagePicker().pickMultiImage();
    if (!mounted) return;
    if (newImages.isEmpty) return;

    state = state.copyWith(
      selectedImages: [...state.selectedImages, ...newImages],
      uploadFile: null,
      error: null,
    );
  }

  void reorderImages(int oldIndex, int newIndex) {
    final images = [...state.selectedImages];
    if (!mounted) return;
    final image = images.removeAt(oldIndex);
    images.insert(newIndex, image);
    state = state.copyWith(
      selectedImages: images,
      // invalidate any previously generated PDF — it no longer matches the current image set
      uploadFile: null,
      error: null,
    );
  }

  void removeImageAt(int index) {
    final images = [...state.selectedImages];
    images.removeAt(index);
    state = state.copyWith(
      selectedImages: images,
      // invalidate any previously generated PDF — it no longer matches the current image set
      uploadFile: null,
      error: null,
    );
  }

  void previewImage(int index) {
    state = state.copyWith(previewIndex: index);
  }

  Future<void> generatePDF() async {
    try {
      final images = [...state.selectedImages];
      if (images.isEmpty) return;
      if (state.isGeneratingPDF) return;
      state = state.copyWith(isGeneratingPDF: true, error: null);
      final pdf = await ImagesToPdfService().generate(images);
      final fileSize = await pdf.length();
      if (!mounted) return;
      if (fileSize > maxFileSize) {
        throw Exception("File size exceeded (max. 100 MB)");
      }
      final uploadFile = UploadFile(
        file: pdf,
        contentType: NoteContentType.pdf,
        uploadSource: UploadSource.images,
        sizeInBytes: fileSize,
        pageCount: images.length,
      );
      state = state.copyWith(
        uploadFile: uploadFile,
        currentStep: UploadStep.basicDetails,
        error: null,
      );
    } catch (e) {
      if (!mounted) return;
      state = state.copyWith(
        error: const AppFailure(
          message: 'Error generating PDF. Please try again.',
          retryable: true,
        ),
      );
    } finally {
      state = state.copyWith(isGeneratingPDF: false);
    }
  }

  Future<int> _getPdfPageCount(String path) async {
    final document = await PdfDocument.openFile(path);
    final pageCount = document.pages.length;
    await document.dispose();
    return pageCount;
  }

  void clearSelectedImages() {
    state = state.copyWith(selectedImages: const [], error: null);
  }

  void removeFile() {
    state = state.copyWith(
      uploadFile: null,
      error: null,
      currentStep: UploadStep.file,
      currentScreen: UploadScreenEnum.details,
    );
  }

  void resetUpload() {
    state = const UploadState();
  }

  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateDescription(String description) {
    state = state.copyWith(description: description);
  }

  void updateUniversity(String? university) {
    state = state.copyWith(university: university);
  }

  void updateCollegeName(String? collegeName) {
    state = state.copyWith(collegeName: collegeName);
  }

  void updateCourse(String course) {
    state = state.copyWith(course: course);
  }

  void updateBranch(String? branch) {
    state = state.copyWith(branch: branch);
  }

  void updateSemester(int? semester) {
    state = state.copyWith(semester: semester);
  }

  void updateSubject(String subject) {
    state = state.copyWith(subject: subject);
  }

  void updateNoteCategory(NoteCategoryEnum noteCategory) {
    state = state.copyWith(noteCategory: noteCategory);
  }

  void updateIsPublic(bool isPublic) {
    state = state.copyWith(isPublic: isPublic);
  }
  
  void updateCanDownload(bool canDownload){
    state = state.copyWith(canDownload: canDownload);
  }

  void updateOwnership(bool ownership) {
    state = state.copyWith(
      declarations: state.declarations.copyWith(ownership: ownership),
    );
  }

  void updateCopyright(bool copyright) {
    state = state.copyWith(
      declarations: state.declarations.copyWith(copyright: copyright),
    );
  }

  void updateGuidelines(bool guidelines) {
    state = state.copyWith(
      declarations: state.declarations.copyWith(guidelines: guidelines),
    );
  }

  void updateConsequences(bool consequences) {
    state = state.copyWith(
      declarations: state.declarations.copyWith(consequences: consequences),
    );
  }

  void addTags(String tag) {
    tag = tag.trim();
    if (tag.isEmpty) return;
    if (state.tags.length >= maxTagLength) return;
    if (state.tags.any((t) => t.toLowerCase() == tag.toLowerCase())) {
      return;
    }
    state = state.copyWith(tags: [...state.tags, tag]);
  }

  void removeTag(String tag) {
    state = state.copyWith(tags: state.tags.where((t) => t != tag).toList());
  }

  void previousScreen() {
    if (state.currentScreen != UploadScreenEnum.details) {
      state = state.copyWith(
        currentScreen: UploadScreenEnum.values[state.currentScreen.index - 1],
        currentStep: UploadStep.values[state.currentStep.index - 1],
      );
    }
  }

  void nextScreen() {
    if (state.currentScreen != UploadScreenEnum.review) {
      state = state.copyWith(
        currentScreen: UploadScreenEnum.values[state.currentScreen.index + 1],
        currentStep: UploadStep.values[state.currentStep.index + 1],
      );
    }
  }

  NoteUploadStepStatusEnum getFileStatus() {
    if (state.uploadFile == null) {
      return NoteUploadStepStatusEnum.inProgress;
    }
    return NoteUploadStepStatusEnum.completed;
  }

  NoteUploadStepStatusEnum getDetailsStatus() {
    if (state.title.isEmpty ||
        state.description.isEmpty ||
        state.subject == null ||
        state.course == null) {
      return NoteUploadStepStatusEnum.inProgress;
    }
    return NoteUploadStepStatusEnum.completed;
  }

  NoteUploadStepStatusEnum getSettingsStatus() {
    return NoteUploadStepStatusEnum.completed;
  }

  NoteUploadStepStatusEnum getReviewStatus() {
    if (_checkDeclarations()) {
      return NoteUploadStepStatusEnum.completed;
    } else {
      return NoteUploadStepStatusEnum.inProgress;
    }
  }

  bool validateCurrentStep([UploadState? overrideState]) {
    final s = overrideState ?? state;
    switch (s.currentStep) {
      case UploadStep.file:
        return s.uploadFile != null;

      case UploadStep.basicDetails:
        return (s.title.trim().isNotEmpty &&
                (s.title.trim().length >= 3 &&
                    s.title.trim().length <= 120)) &&
            (s.description.trim().isNotEmpty &&
                (s.description.trim().length >= 5 &&
                    s.description.trim().length <= 1000)) &&
            s.course != null &&
            s.subject != null;

      case UploadStep.noteSettings:
        return true;

      case UploadStep.review:
        return _checkDeclarations();
    }
  }

  bool _checkDeclarations() {
    return state.declarations.allAccepted == true;
  }

  (CreateNoteDto, File)? _checkAllValidationsBeforeUpload() {
    if (state.uploadFile == null) {
      state = state.copyWith(
        error: const AppFailure(
          message: 'Please select a file.',
          retryable: true,
        ),
      );
      return null;
    }

    if (!_checkDeclarations()) {
      state = state.copyWith(
        error: const AppFailure(
          message: 'Please accept all declarations.',
          retryable: true,
        ),
      );
      return null;
    }

    final currentCourse = state.course;
    final currentSubject = state.subject;

    if (currentCourse == null ||
        currentCourse.trim().isEmpty ||
        currentSubject == null ||
        currentSubject.trim().isEmpty) {
      state = state.copyWith(
        error: const AppFailure(
          message: 'Course and Subject fields are required.',
          retryable: true,
        ),
      );
      return null;
    }

    final file = state.uploadFile!.file;

    final dto = CreateNoteDto(
      title: state.title,
      description: state.description,
      category: state.noteCategory,
      subject: state.subject!,
      course: state.course!,
      branch: state.branch,
      tags: state.tags,
      collegeName: state.collegeName,
      university: state.university,
      isPublic: state.isPublic,
      semester: state.semester,
      canDownload: state.canDownload,
      language: state.language,
    );
    print("BEFORE Sending: $dto");
    return (dto, file);
  }

  Future<void> _uploadNote() async {
    if (!mounted) return;
    if (state.noteUploadStatus == NoteUploadStatus.uploading) return;

    final fileData = _checkAllValidationsBeforeUpload();

    if (fileData == null) {
      return;
    }

    try {
      state = state.copyWith(uploadProgress: 0.0, error: null, noteUploadStatus: NoteUploadStatus.uploading);
      double lastReportedProgress = 0;
      final response = await _noteRepository.createNote(
        note: fileData.$1,
        file: fileData.$2,
        onSendProgress: (sent, total) {
          if (!mounted || total <= 0) return;
          final progress = sent/total;
          if (progress - lastReportedProgress < 0.01 && progress < 1.0) return;
          lastReportedProgress = progress;
          state = state.copyWith(uploadProgress: progress);
          
        },
      );
      print(response.runtimeType);
      print("Response After SENDING: $response");
      state = state.copyWith(
        uploadProgress: 1.0,
        noteUploadStatus: NoteUploadStatus.success,
      );
    } on AppException catch (exception) {
      if (!mounted) return;
      state = state.copyWith(
        error: AppFailureMapper.map(exception),
        noteUploadStatus: NoteUploadStatus.failure,
      );
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      debugPrint("Error: $error");
      if (!mounted) return;

      state = state.copyWith(
        error: const AppFailure(
          message: 'Something went wrong. Please try again.',
          retryable: true,
        ),
        noteUploadStatus: NoteUploadStatus.failure,
      );
    }
  }

  Future<void> handlePublishNote() async {
    _uploadNote();
  }

  Future<void> retryNoteUpload() async {
    _uploadNote();
  }

  Future<void> cancelUpload() async {}
}
