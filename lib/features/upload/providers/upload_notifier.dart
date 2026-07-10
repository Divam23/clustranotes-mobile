import 'dart:io';
import 'package:clustranotes_mobile/core/models/note_content_type_enum.dart';
import 'package:clustranotes_mobile/features/notes/models/note_enums.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/upload_source_enums.dart';
import 'package:clustranotes_mobile/features/upload/models/upload_file.dart';
import 'package:clustranotes_mobile/features/upload/providers/upload_state.dart';
import 'package:clustranotes_mobile/features/upload/services/images_to_pdf_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:image_picker/image_picker.dart';

final uploadProvider = StateNotifierProvider<UploadNotifier, UploadState>((
  ref,
) {
  return UploadNotifier();
});

class UploadNotifier extends StateNotifier<UploadState> {
  UploadNotifier() : super(const UploadState());

  Future<void> pickImages() async {
    if(!mounted) return;
    state = state.copyWith( isPickingDocument: true , error: null);
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
  
  Future<void> pickDocument() async{
    try{
      if(!mounted) return;
      state = state.copyWith( isPickingDocument: true , error: null);
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
      if(pickedFile.path == null || pickedFile.extension == null) {
        throw Exception('Invalid file selected.');
      }
      final file = File(pickedFile.path!);
      final fileExtension = NoteContentTypeJson.fromExtension(
        pickedFile.extension!
      );
      final uploadFile = UploadFile(
        file: file, 
        contentType: fileExtension, 
        sizeInBytes: await file.length(),
        uploadSource: UploadSource.file,
        pageCount: null,
        selectedImages: null
      );
      state = state.copyWith(
        uploadFile: uploadFile,
        error: null
      );
    }
    catch(e){
      if (!mounted) return;
      state = state.copyWith(
        error: e.toString(),
      );
    }
    finally{
      state = state.copyWith(
        isPickingDocument: false,
      );
    }
  }
  
  Future<void> addImages() async{
    final newImages = await ImagePicker().pickMultiImage();
    if(!mounted) return;
    if(newImages.isEmpty) return;
    
    state = state.copyWith(
      selectedImages: [
        ...state.selectedImages,
        ...newImages,
      ],
      uploadFile: null,
      error: null
    );
  }
  
  void reorderImages(
    int oldIndex,
    int newIndex
  ){
    final images = [...state.selectedImages];
    if(!mounted) return;
    final image = images.removeAt(oldIndex);
    images.insert(newIndex, image);
    state = state.copyWith(
      selectedImages: images,
      // invalidate any previously generated PDF — it no longer matches the current image set
      uploadFile: null,
      error: null
    );
  }
  
  void removeImageAt(int index){
    final images = [...state.selectedImages];
    images.removeAt(index);
    state = state.copyWith(
      selectedImages: images,
      // invalidate any previously generated PDF — it no longer matches the current image set
      uploadFile: null,
      error: null
    );
  }
  
  void previewImage(int index){
    state = state.copyWith(
      previewIndex: index
    );
  }
  
  Future<void> generatePDF() async{
    try{
      final images = [...state.selectedImages];
      if (images.isEmpty) return;
      if(state.isGeneratingPDF) return;
      state = state.copyWith(isGeneratingPDF: true, error: null);
      final pdf = await ImagesToPdfService().generate(images);
      if(!mounted) return;
      final uploadFile = UploadFile(
          file: pdf,
          contentType: NoteContentType.pdf,
          uploadSource: UploadSource.images,
          sizeInBytes: await pdf.length(),
          pageCount: images.length,
      );
      state = state.copyWith(
        uploadFile: uploadFile,
      );
      
    }
    catch(e){
      if(!mounted) return;
      state = state.copyWith(
        error: e.toString()
      );
    }
    finally{
      state = state.copyWith(isGeneratingPDF: false);
    }

  }
  
  void clearSelectedImages(){
    state = state.copyWith(
     selectedImages: const [],
      error: null
    );
  }
  
  void removeFile() {
    state = state.copyWith(uploadFile: null, error: null);
  }
  
  void resetUpload(){
    state = const UploadState();
  }

  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }
  
  void updateDescription(String description){
    state = state.copyWith(description: description);
  }
  
  void updateUniversity(String? university){
    state = state.copyWith(university: university);
  }
  
  void updateCollegeName(String? collegeName){
    state = state.copyWith(collegeName: collegeName);
  }
  
  void updateCourse(String course){
    state = state.copyWith(course: course);
  }
  
  void updateBranch(String? branch){
    state = state.copyWith(branch: branch);
  }
  
  void updateSemester(int? semester){
    state = state.copyWith(semester: semester);
  }
  
  void updateSubject(String? subject){
    state = state.copyWith(subject: subject);
  }
  
  void updateNoteCategory(NoteCategory? noteCategory){
    state = state.copyWith(noteCategory: noteCategory);
  }
  
  void updateIsPublic(bool isPublic){
    state = state.copyWith(isPublic: isPublic);
  }
  
  void updateIsUploading(bool isUploading){
    state = state.copyWith(isUploading: isUploading);
  }
  
  
}
