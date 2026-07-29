// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UploadState {

 UploadFile? get uploadFile; List<XFile> get selectedImages; String get title; String get description; String? get subject; String? get course; String? get branch; NoteCategory get noteCategory; List<String> get tags; String? get collegeName; String? get university; UploadStep get currentStep; UploadScreenEnum get currentScreen; int? get semester; int? get previewIndex; bool get isPublic; bool get isGeneratingPDF; bool get isPickingDocument; bool get isUploading; UploadDeclarations get declarations; String? get error;
/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadStateCopyWith<UploadState> get copyWith => _$UploadStateCopyWithImpl<UploadState>(this as UploadState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadState&&(identical(other.uploadFile, uploadFile) || other.uploadFile == uploadFile)&&const DeepCollectionEquality().equals(other.selectedImages, selectedImages)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.course, course) || other.course == course)&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.noteCategory, noteCategory) || other.noteCategory == noteCategory)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.collegeName, collegeName) || other.collegeName == collegeName)&&(identical(other.university, university) || other.university == university)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.currentScreen, currentScreen) || other.currentScreen == currentScreen)&&(identical(other.semester, semester) || other.semester == semester)&&(identical(other.previewIndex, previewIndex) || other.previewIndex == previewIndex)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isGeneratingPDF, isGeneratingPDF) || other.isGeneratingPDF == isGeneratingPDF)&&(identical(other.isPickingDocument, isPickingDocument) || other.isPickingDocument == isPickingDocument)&&(identical(other.isUploading, isUploading) || other.isUploading == isUploading)&&(identical(other.declarations, declarations) || other.declarations == declarations)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hashAll([runtimeType,uploadFile,const DeepCollectionEquality().hash(selectedImages),title,description,subject,course,branch,noteCategory,const DeepCollectionEquality().hash(tags),collegeName,university,currentStep,currentScreen,semester,previewIndex,isPublic,isGeneratingPDF,isPickingDocument,isUploading,declarations,error]);

@override
String toString() {
  return 'UploadState(uploadFile: $uploadFile, selectedImages: $selectedImages, title: $title, description: $description, subject: $subject, course: $course, branch: $branch, noteCategory: $noteCategory, tags: $tags, collegeName: $collegeName, university: $university, currentStep: $currentStep, currentScreen: $currentScreen, semester: $semester, previewIndex: $previewIndex, isPublic: $isPublic, isGeneratingPDF: $isGeneratingPDF, isPickingDocument: $isPickingDocument, isUploading: $isUploading, declarations: $declarations, error: $error)';
}


}

/// @nodoc
abstract mixin class $UploadStateCopyWith<$Res>  {
  factory $UploadStateCopyWith(UploadState value, $Res Function(UploadState) _then) = _$UploadStateCopyWithImpl;
@useResult
$Res call({
 UploadFile? uploadFile, List<XFile> selectedImages, String title, String description, String? subject, String? course, String? branch, NoteCategory noteCategory, List<String> tags, String? collegeName, String? university, UploadStep currentStep, UploadScreenEnum currentScreen, int? semester, int? previewIndex, bool isPublic, bool isGeneratingPDF, bool isPickingDocument, bool isUploading, UploadDeclarations declarations, String? error
});




}
/// @nodoc
class _$UploadStateCopyWithImpl<$Res>
    implements $UploadStateCopyWith<$Res> {
  _$UploadStateCopyWithImpl(this._self, this._then);

  final UploadState _self;
  final $Res Function(UploadState) _then;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uploadFile = freezed,Object? selectedImages = null,Object? title = null,Object? description = null,Object? subject = freezed,Object? course = freezed,Object? branch = freezed,Object? noteCategory = null,Object? tags = null,Object? collegeName = freezed,Object? university = freezed,Object? currentStep = null,Object? currentScreen = null,Object? semester = freezed,Object? previewIndex = freezed,Object? isPublic = null,Object? isGeneratingPDF = null,Object? isPickingDocument = null,Object? isUploading = null,Object? declarations = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
uploadFile: freezed == uploadFile ? _self.uploadFile : uploadFile // ignore: cast_nullable_to_non_nullable
as UploadFile?,selectedImages: null == selectedImages ? _self.selectedImages : selectedImages // ignore: cast_nullable_to_non_nullable
as List<XFile>,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,subject: freezed == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String?,course: freezed == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as String?,branch: freezed == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as String?,noteCategory: null == noteCategory ? _self.noteCategory : noteCategory // ignore: cast_nullable_to_non_nullable
as NoteCategory,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,collegeName: freezed == collegeName ? _self.collegeName : collegeName // ignore: cast_nullable_to_non_nullable
as String?,university: freezed == university ? _self.university : university // ignore: cast_nullable_to_non_nullable
as String?,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as UploadStep,currentScreen: null == currentScreen ? _self.currentScreen : currentScreen // ignore: cast_nullable_to_non_nullable
as UploadScreenEnum,semester: freezed == semester ? _self.semester : semester // ignore: cast_nullable_to_non_nullable
as int?,previewIndex: freezed == previewIndex ? _self.previewIndex : previewIndex // ignore: cast_nullable_to_non_nullable
as int?,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,isGeneratingPDF: null == isGeneratingPDF ? _self.isGeneratingPDF : isGeneratingPDF // ignore: cast_nullable_to_non_nullable
as bool,isPickingDocument: null == isPickingDocument ? _self.isPickingDocument : isPickingDocument // ignore: cast_nullable_to_non_nullable
as bool,isUploading: null == isUploading ? _self.isUploading : isUploading // ignore: cast_nullable_to_non_nullable
as bool,declarations: null == declarations ? _self.declarations : declarations // ignore: cast_nullable_to_non_nullable
as UploadDeclarations,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadState].
extension UploadStatePatterns on UploadState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadState value)  $default,){
final _that = this;
switch (_that) {
case _UploadState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadState value)?  $default,){
final _that = this;
switch (_that) {
case _UploadState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UploadFile? uploadFile,  List<XFile> selectedImages,  String title,  String description,  String? subject,  String? course,  String? branch,  NoteCategory noteCategory,  List<String> tags,  String? collegeName,  String? university,  UploadStep currentStep,  UploadScreenEnum currentScreen,  int? semester,  int? previewIndex,  bool isPublic,  bool isGeneratingPDF,  bool isPickingDocument,  bool isUploading,  UploadDeclarations declarations,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadState() when $default != null:
return $default(_that.uploadFile,_that.selectedImages,_that.title,_that.description,_that.subject,_that.course,_that.branch,_that.noteCategory,_that.tags,_that.collegeName,_that.university,_that.currentStep,_that.currentScreen,_that.semester,_that.previewIndex,_that.isPublic,_that.isGeneratingPDF,_that.isPickingDocument,_that.isUploading,_that.declarations,_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UploadFile? uploadFile,  List<XFile> selectedImages,  String title,  String description,  String? subject,  String? course,  String? branch,  NoteCategory noteCategory,  List<String> tags,  String? collegeName,  String? university,  UploadStep currentStep,  UploadScreenEnum currentScreen,  int? semester,  int? previewIndex,  bool isPublic,  bool isGeneratingPDF,  bool isPickingDocument,  bool isUploading,  UploadDeclarations declarations,  String? error)  $default,) {final _that = this;
switch (_that) {
case _UploadState():
return $default(_that.uploadFile,_that.selectedImages,_that.title,_that.description,_that.subject,_that.course,_that.branch,_that.noteCategory,_that.tags,_that.collegeName,_that.university,_that.currentStep,_that.currentScreen,_that.semester,_that.previewIndex,_that.isPublic,_that.isGeneratingPDF,_that.isPickingDocument,_that.isUploading,_that.declarations,_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UploadFile? uploadFile,  List<XFile> selectedImages,  String title,  String description,  String? subject,  String? course,  String? branch,  NoteCategory noteCategory,  List<String> tags,  String? collegeName,  String? university,  UploadStep currentStep,  UploadScreenEnum currentScreen,  int? semester,  int? previewIndex,  bool isPublic,  bool isGeneratingPDF,  bool isPickingDocument,  bool isUploading,  UploadDeclarations declarations,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _UploadState() when $default != null:
return $default(_that.uploadFile,_that.selectedImages,_that.title,_that.description,_that.subject,_that.course,_that.branch,_that.noteCategory,_that.tags,_that.collegeName,_that.university,_that.currentStep,_that.currentScreen,_that.semester,_that.previewIndex,_that.isPublic,_that.isGeneratingPDF,_that.isPickingDocument,_that.isUploading,_that.declarations,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _UploadState implements UploadState {
  const _UploadState({this.uploadFile, final  List<XFile> selectedImages = const <XFile>[], this.title = "", this.description = "", this.subject, this.course, this.branch, this.noteCategory = NoteCategory.lectureNotes, final  List<String> tags = const <String>[], this.collegeName, this.university, this.currentStep = UploadStep.file, this.currentScreen = UploadScreenEnum.details, this.semester, this.previewIndex, this.isPublic = true, this.isGeneratingPDF = false, this.isPickingDocument = false, this.isUploading = false, this.declarations = const UploadDeclarations(), this.error}): _selectedImages = selectedImages,_tags = tags;
  

@override final  UploadFile? uploadFile;
 final  List<XFile> _selectedImages;
@override@JsonKey() List<XFile> get selectedImages {
  if (_selectedImages is EqualUnmodifiableListView) return _selectedImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedImages);
}

@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override final  String? subject;
@override final  String? course;
@override final  String? branch;
@override@JsonKey() final  NoteCategory noteCategory;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  String? collegeName;
@override final  String? university;
@override@JsonKey() final  UploadStep currentStep;
@override@JsonKey() final  UploadScreenEnum currentScreen;
@override final  int? semester;
@override final  int? previewIndex;
@override@JsonKey() final  bool isPublic;
@override@JsonKey() final  bool isGeneratingPDF;
@override@JsonKey() final  bool isPickingDocument;
@override@JsonKey() final  bool isUploading;
@override@JsonKey() final  UploadDeclarations declarations;
@override final  String? error;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadStateCopyWith<_UploadState> get copyWith => __$UploadStateCopyWithImpl<_UploadState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadState&&(identical(other.uploadFile, uploadFile) || other.uploadFile == uploadFile)&&const DeepCollectionEquality().equals(other._selectedImages, _selectedImages)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.course, course) || other.course == course)&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.noteCategory, noteCategory) || other.noteCategory == noteCategory)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.collegeName, collegeName) || other.collegeName == collegeName)&&(identical(other.university, university) || other.university == university)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.currentScreen, currentScreen) || other.currentScreen == currentScreen)&&(identical(other.semester, semester) || other.semester == semester)&&(identical(other.previewIndex, previewIndex) || other.previewIndex == previewIndex)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isGeneratingPDF, isGeneratingPDF) || other.isGeneratingPDF == isGeneratingPDF)&&(identical(other.isPickingDocument, isPickingDocument) || other.isPickingDocument == isPickingDocument)&&(identical(other.isUploading, isUploading) || other.isUploading == isUploading)&&(identical(other.declarations, declarations) || other.declarations == declarations)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hashAll([runtimeType,uploadFile,const DeepCollectionEquality().hash(_selectedImages),title,description,subject,course,branch,noteCategory,const DeepCollectionEquality().hash(_tags),collegeName,university,currentStep,currentScreen,semester,previewIndex,isPublic,isGeneratingPDF,isPickingDocument,isUploading,declarations,error]);

@override
String toString() {
  return 'UploadState(uploadFile: $uploadFile, selectedImages: $selectedImages, title: $title, description: $description, subject: $subject, course: $course, branch: $branch, noteCategory: $noteCategory, tags: $tags, collegeName: $collegeName, university: $university, currentStep: $currentStep, currentScreen: $currentScreen, semester: $semester, previewIndex: $previewIndex, isPublic: $isPublic, isGeneratingPDF: $isGeneratingPDF, isPickingDocument: $isPickingDocument, isUploading: $isUploading, declarations: $declarations, error: $error)';
}


}

/// @nodoc
abstract mixin class _$UploadStateCopyWith<$Res> implements $UploadStateCopyWith<$Res> {
  factory _$UploadStateCopyWith(_UploadState value, $Res Function(_UploadState) _then) = __$UploadStateCopyWithImpl;
@override @useResult
$Res call({
 UploadFile? uploadFile, List<XFile> selectedImages, String title, String description, String? subject, String? course, String? branch, NoteCategory noteCategory, List<String> tags, String? collegeName, String? university, UploadStep currentStep, UploadScreenEnum currentScreen, int? semester, int? previewIndex, bool isPublic, bool isGeneratingPDF, bool isPickingDocument, bool isUploading, UploadDeclarations declarations, String? error
});




}
/// @nodoc
class __$UploadStateCopyWithImpl<$Res>
    implements _$UploadStateCopyWith<$Res> {
  __$UploadStateCopyWithImpl(this._self, this._then);

  final _UploadState _self;
  final $Res Function(_UploadState) _then;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uploadFile = freezed,Object? selectedImages = null,Object? title = null,Object? description = null,Object? subject = freezed,Object? course = freezed,Object? branch = freezed,Object? noteCategory = null,Object? tags = null,Object? collegeName = freezed,Object? university = freezed,Object? currentStep = null,Object? currentScreen = null,Object? semester = freezed,Object? previewIndex = freezed,Object? isPublic = null,Object? isGeneratingPDF = null,Object? isPickingDocument = null,Object? isUploading = null,Object? declarations = null,Object? error = freezed,}) {
  return _then(_UploadState(
uploadFile: freezed == uploadFile ? _self.uploadFile : uploadFile // ignore: cast_nullable_to_non_nullable
as UploadFile?,selectedImages: null == selectedImages ? _self._selectedImages : selectedImages // ignore: cast_nullable_to_non_nullable
as List<XFile>,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,subject: freezed == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String?,course: freezed == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as String?,branch: freezed == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as String?,noteCategory: null == noteCategory ? _self.noteCategory : noteCategory // ignore: cast_nullable_to_non_nullable
as NoteCategory,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,collegeName: freezed == collegeName ? _self.collegeName : collegeName // ignore: cast_nullable_to_non_nullable
as String?,university: freezed == university ? _self.university : university // ignore: cast_nullable_to_non_nullable
as String?,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as UploadStep,currentScreen: null == currentScreen ? _self.currentScreen : currentScreen // ignore: cast_nullable_to_non_nullable
as UploadScreenEnum,semester: freezed == semester ? _self.semester : semester // ignore: cast_nullable_to_non_nullable
as int?,previewIndex: freezed == previewIndex ? _self.previewIndex : previewIndex // ignore: cast_nullable_to_non_nullable
as int?,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,isGeneratingPDF: null == isGeneratingPDF ? _self.isGeneratingPDF : isGeneratingPDF // ignore: cast_nullable_to_non_nullable
as bool,isPickingDocument: null == isPickingDocument ? _self.isPickingDocument : isPickingDocument // ignore: cast_nullable_to_non_nullable
as bool,isUploading: null == isUploading ? _self.isUploading : isUploading // ignore: cast_nullable_to_non_nullable
as bool,declarations: null == declarations ? _self.declarations : declarations // ignore: cast_nullable_to_non_nullable
as UploadDeclarations,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
