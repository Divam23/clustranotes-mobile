// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contribution_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContributionState {

 List<UploadedNoteSummary> get notesSummary; List<UploadedNoteCard> get notes; NoteStatusStats? get noteStatusStats; NoteOwnerStatus? get selectedStatus; dynamic get uploadLoadingActionStatus; dynamic get loadingAction; bool get isLoading; bool get isExpanded; AppFailure? get error; bool get isRefreshing; int get currentPage; int get totalPages; int get pageSize; bool get isLoadingMore; bool get hasReachedEnd; bool get hasFetchedNotes;
/// Create a copy of ContributionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContributionStateCopyWith<ContributionState> get copyWith => _$ContributionStateCopyWithImpl<ContributionState>(this as ContributionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContributionState&&const DeepCollectionEquality().equals(other.notesSummary, notesSummary)&&const DeepCollectionEquality().equals(other.notes, notes)&&(identical(other.noteStatusStats, noteStatusStats) || other.noteStatusStats == noteStatusStats)&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&const DeepCollectionEquality().equals(other.uploadLoadingActionStatus, uploadLoadingActionStatus)&&const DeepCollectionEquality().equals(other.loadingAction, loadingAction)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded)&&(identical(other.error, error) || other.error == error)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasReachedEnd, hasReachedEnd) || other.hasReachedEnd == hasReachedEnd)&&(identical(other.hasFetchedNotes, hasFetchedNotes) || other.hasFetchedNotes == hasFetchedNotes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(notesSummary),const DeepCollectionEquality().hash(notes),noteStatusStats,selectedStatus,const DeepCollectionEquality().hash(uploadLoadingActionStatus),const DeepCollectionEquality().hash(loadingAction),isLoading,isExpanded,error,isRefreshing,currentPage,totalPages,pageSize,isLoadingMore,hasReachedEnd,hasFetchedNotes);

@override
String toString() {
  return 'ContributionState(notesSummary: $notesSummary, notes: $notes, noteStatusStats: $noteStatusStats, selectedStatus: $selectedStatus, uploadLoadingActionStatus: $uploadLoadingActionStatus, loadingAction: $loadingAction, isLoading: $isLoading, isExpanded: $isExpanded, error: $error, isRefreshing: $isRefreshing, currentPage: $currentPage, totalPages: $totalPages, pageSize: $pageSize, isLoadingMore: $isLoadingMore, hasReachedEnd: $hasReachedEnd, hasFetchedNotes: $hasFetchedNotes)';
}


}

/// @nodoc
abstract mixin class $ContributionStateCopyWith<$Res>  {
  factory $ContributionStateCopyWith(ContributionState value, $Res Function(ContributionState) _then) = _$ContributionStateCopyWithImpl;
@useResult
$Res call({
 List<UploadedNoteSummary> notesSummary, List<UploadedNoteCard> notes, NoteStatusStats? noteStatusStats, NoteOwnerStatus? selectedStatus, dynamic uploadLoadingActionStatus, dynamic loadingAction, bool isLoading, bool isExpanded, AppFailure? error, bool isRefreshing, int currentPage, int totalPages, int pageSize, bool isLoadingMore, bool hasReachedEnd, bool hasFetchedNotes
});




}
/// @nodoc
class _$ContributionStateCopyWithImpl<$Res>
    implements $ContributionStateCopyWith<$Res> {
  _$ContributionStateCopyWithImpl(this._self, this._then);

  final ContributionState _self;
  final $Res Function(ContributionState) _then;

/// Create a copy of ContributionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notesSummary = null,Object? notes = null,Object? noteStatusStats = freezed,Object? selectedStatus = freezed,Object? uploadLoadingActionStatus = freezed,Object? loadingAction = freezed,Object? isLoading = null,Object? isExpanded = null,Object? error = freezed,Object? isRefreshing = null,Object? currentPage = null,Object? totalPages = null,Object? pageSize = null,Object? isLoadingMore = null,Object? hasReachedEnd = null,Object? hasFetchedNotes = null,}) {
  return _then(_self.copyWith(
notesSummary: null == notesSummary ? _self.notesSummary : notesSummary // ignore: cast_nullable_to_non_nullable
as List<UploadedNoteSummary>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as List<UploadedNoteCard>,noteStatusStats: freezed == noteStatusStats ? _self.noteStatusStats : noteStatusStats // ignore: cast_nullable_to_non_nullable
as NoteStatusStats?,selectedStatus: freezed == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as NoteOwnerStatus?,uploadLoadingActionStatus: freezed == uploadLoadingActionStatus ? _self.uploadLoadingActionStatus : uploadLoadingActionStatus // ignore: cast_nullable_to_non_nullable
as dynamic,loadingAction: freezed == loadingAction ? _self.loadingAction : loadingAction // ignore: cast_nullable_to_non_nullable
as dynamic,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppFailure?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasReachedEnd: null == hasReachedEnd ? _self.hasReachedEnd : hasReachedEnd // ignore: cast_nullable_to_non_nullable
as bool,hasFetchedNotes: null == hasFetchedNotes ? _self.hasFetchedNotes : hasFetchedNotes // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ContributionState].
extension ContributionStatePatterns on ContributionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContributionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContributionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContributionState value)  $default,){
final _that = this;
switch (_that) {
case _ContributionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContributionState value)?  $default,){
final _that = this;
switch (_that) {
case _ContributionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UploadedNoteSummary> notesSummary,  List<UploadedNoteCard> notes,  NoteStatusStats? noteStatusStats,  NoteOwnerStatus? selectedStatus,  dynamic uploadLoadingActionStatus,  dynamic loadingAction,  bool isLoading,  bool isExpanded,  AppFailure? error,  bool isRefreshing,  int currentPage,  int totalPages,  int pageSize,  bool isLoadingMore,  bool hasReachedEnd,  bool hasFetchedNotes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContributionState() when $default != null:
return $default(_that.notesSummary,_that.notes,_that.noteStatusStats,_that.selectedStatus,_that.uploadLoadingActionStatus,_that.loadingAction,_that.isLoading,_that.isExpanded,_that.error,_that.isRefreshing,_that.currentPage,_that.totalPages,_that.pageSize,_that.isLoadingMore,_that.hasReachedEnd,_that.hasFetchedNotes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UploadedNoteSummary> notesSummary,  List<UploadedNoteCard> notes,  NoteStatusStats? noteStatusStats,  NoteOwnerStatus? selectedStatus,  dynamic uploadLoadingActionStatus,  dynamic loadingAction,  bool isLoading,  bool isExpanded,  AppFailure? error,  bool isRefreshing,  int currentPage,  int totalPages,  int pageSize,  bool isLoadingMore,  bool hasReachedEnd,  bool hasFetchedNotes)  $default,) {final _that = this;
switch (_that) {
case _ContributionState():
return $default(_that.notesSummary,_that.notes,_that.noteStatusStats,_that.selectedStatus,_that.uploadLoadingActionStatus,_that.loadingAction,_that.isLoading,_that.isExpanded,_that.error,_that.isRefreshing,_that.currentPage,_that.totalPages,_that.pageSize,_that.isLoadingMore,_that.hasReachedEnd,_that.hasFetchedNotes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UploadedNoteSummary> notesSummary,  List<UploadedNoteCard> notes,  NoteStatusStats? noteStatusStats,  NoteOwnerStatus? selectedStatus,  dynamic uploadLoadingActionStatus,  dynamic loadingAction,  bool isLoading,  bool isExpanded,  AppFailure? error,  bool isRefreshing,  int currentPage,  int totalPages,  int pageSize,  bool isLoadingMore,  bool hasReachedEnd,  bool hasFetchedNotes)?  $default,) {final _that = this;
switch (_that) {
case _ContributionState() when $default != null:
return $default(_that.notesSummary,_that.notes,_that.noteStatusStats,_that.selectedStatus,_that.uploadLoadingActionStatus,_that.loadingAction,_that.isLoading,_that.isExpanded,_that.error,_that.isRefreshing,_that.currentPage,_that.totalPages,_that.pageSize,_that.isLoadingMore,_that.hasReachedEnd,_that.hasFetchedNotes);case _:
  return null;

}
}

}

/// @nodoc


class _ContributionState implements ContributionState {
  const _ContributionState({final  List<UploadedNoteSummary> notesSummary = const [], final  List<UploadedNoteCard> notes = const [], this.noteStatusStats, this.selectedStatus, this.uploadLoadingActionStatus = UploadLoadingActionStatus.idle, this.loadingAction = UploadLoadingAction.idle, this.isLoading = false, this.isExpanded = false, this.error, this.isRefreshing = false, this.currentPage = 1, this.totalPages = 0, this.pageSize = 15, this.isLoadingMore = false, this.hasReachedEnd = false, this.hasFetchedNotes = false}): _notesSummary = notesSummary,_notes = notes;
  

 final  List<UploadedNoteSummary> _notesSummary;
@override@JsonKey() List<UploadedNoteSummary> get notesSummary {
  if (_notesSummary is EqualUnmodifiableListView) return _notesSummary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notesSummary);
}

 final  List<UploadedNoteCard> _notes;
@override@JsonKey() List<UploadedNoteCard> get notes {
  if (_notes is EqualUnmodifiableListView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notes);
}

@override final  NoteStatusStats? noteStatusStats;
@override final  NoteOwnerStatus? selectedStatus;
@override@JsonKey() final  dynamic uploadLoadingActionStatus;
@override@JsonKey() final  dynamic loadingAction;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isExpanded;
@override final  AppFailure? error;
@override@JsonKey() final  bool isRefreshing;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
@override@JsonKey() final  int pageSize;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool hasReachedEnd;
@override@JsonKey() final  bool hasFetchedNotes;

/// Create a copy of ContributionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContributionStateCopyWith<_ContributionState> get copyWith => __$ContributionStateCopyWithImpl<_ContributionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContributionState&&const DeepCollectionEquality().equals(other._notesSummary, _notesSummary)&&const DeepCollectionEquality().equals(other._notes, _notes)&&(identical(other.noteStatusStats, noteStatusStats) || other.noteStatusStats == noteStatusStats)&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&const DeepCollectionEquality().equals(other.uploadLoadingActionStatus, uploadLoadingActionStatus)&&const DeepCollectionEquality().equals(other.loadingAction, loadingAction)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded)&&(identical(other.error, error) || other.error == error)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasReachedEnd, hasReachedEnd) || other.hasReachedEnd == hasReachedEnd)&&(identical(other.hasFetchedNotes, hasFetchedNotes) || other.hasFetchedNotes == hasFetchedNotes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notesSummary),const DeepCollectionEquality().hash(_notes),noteStatusStats,selectedStatus,const DeepCollectionEquality().hash(uploadLoadingActionStatus),const DeepCollectionEquality().hash(loadingAction),isLoading,isExpanded,error,isRefreshing,currentPage,totalPages,pageSize,isLoadingMore,hasReachedEnd,hasFetchedNotes);

@override
String toString() {
  return 'ContributionState(notesSummary: $notesSummary, notes: $notes, noteStatusStats: $noteStatusStats, selectedStatus: $selectedStatus, uploadLoadingActionStatus: $uploadLoadingActionStatus, loadingAction: $loadingAction, isLoading: $isLoading, isExpanded: $isExpanded, error: $error, isRefreshing: $isRefreshing, currentPage: $currentPage, totalPages: $totalPages, pageSize: $pageSize, isLoadingMore: $isLoadingMore, hasReachedEnd: $hasReachedEnd, hasFetchedNotes: $hasFetchedNotes)';
}


}

/// @nodoc
abstract mixin class _$ContributionStateCopyWith<$Res> implements $ContributionStateCopyWith<$Res> {
  factory _$ContributionStateCopyWith(_ContributionState value, $Res Function(_ContributionState) _then) = __$ContributionStateCopyWithImpl;
@override @useResult
$Res call({
 List<UploadedNoteSummary> notesSummary, List<UploadedNoteCard> notes, NoteStatusStats? noteStatusStats, NoteOwnerStatus? selectedStatus, dynamic uploadLoadingActionStatus, dynamic loadingAction, bool isLoading, bool isExpanded, AppFailure? error, bool isRefreshing, int currentPage, int totalPages, int pageSize, bool isLoadingMore, bool hasReachedEnd, bool hasFetchedNotes
});




}
/// @nodoc
class __$ContributionStateCopyWithImpl<$Res>
    implements _$ContributionStateCopyWith<$Res> {
  __$ContributionStateCopyWithImpl(this._self, this._then);

  final _ContributionState _self;
  final $Res Function(_ContributionState) _then;

/// Create a copy of ContributionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notesSummary = null,Object? notes = null,Object? noteStatusStats = freezed,Object? selectedStatus = freezed,Object? uploadLoadingActionStatus = freezed,Object? loadingAction = freezed,Object? isLoading = null,Object? isExpanded = null,Object? error = freezed,Object? isRefreshing = null,Object? currentPage = null,Object? totalPages = null,Object? pageSize = null,Object? isLoadingMore = null,Object? hasReachedEnd = null,Object? hasFetchedNotes = null,}) {
  return _then(_ContributionState(
notesSummary: null == notesSummary ? _self._notesSummary : notesSummary // ignore: cast_nullable_to_non_nullable
as List<UploadedNoteSummary>,notes: null == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as List<UploadedNoteCard>,noteStatusStats: freezed == noteStatusStats ? _self.noteStatusStats : noteStatusStats // ignore: cast_nullable_to_non_nullable
as NoteStatusStats?,selectedStatus: freezed == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as NoteOwnerStatus?,uploadLoadingActionStatus: freezed == uploadLoadingActionStatus ? _self.uploadLoadingActionStatus : uploadLoadingActionStatus // ignore: cast_nullable_to_non_nullable
as dynamic,loadingAction: freezed == loadingAction ? _self.loadingAction : loadingAction // ignore: cast_nullable_to_non_nullable
as dynamic,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppFailure?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasReachedEnd: null == hasReachedEnd ? _self.hasReachedEnd : hasReachedEnd // ignore: cast_nullable_to_non_nullable
as bool,hasFetchedNotes: null == hasFetchedNotes ? _self.hasFetchedNotes : hasFetchedNotes // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
