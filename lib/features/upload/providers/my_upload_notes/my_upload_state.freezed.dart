// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_upload_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyUploadState {

 List<UploadedNoteSummary> get notes; NoteOwnerStatus? get selectedStatus; bool get isLoading; String? get error; bool get isRefreshing; bool get hasReachedEnd; String? get nextCursor;
/// Create a copy of MyUploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyUploadStateCopyWith<MyUploadState> get copyWith => _$MyUploadStateCopyWithImpl<MyUploadState>(this as MyUploadState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyUploadState&&const DeepCollectionEquality().equals(other.notes, notes)&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.hasReachedEnd, hasReachedEnd) || other.hasReachedEnd == hasReachedEnd)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(notes),selectedStatus,isLoading,error,isRefreshing,hasReachedEnd,nextCursor);

@override
String toString() {
  return 'MyUploadState(notes: $notes, selectedStatus: $selectedStatus, isLoading: $isLoading, error: $error, isRefreshing: $isRefreshing, hasReachedEnd: $hasReachedEnd, nextCursor: $nextCursor)';
}


}

/// @nodoc
abstract mixin class $MyUploadStateCopyWith<$Res>  {
  factory $MyUploadStateCopyWith(MyUploadState value, $Res Function(MyUploadState) _then) = _$MyUploadStateCopyWithImpl;
@useResult
$Res call({
 List<UploadedNoteSummary> notes, NoteOwnerStatus? selectedStatus, bool isLoading, String? error, bool isRefreshing, bool hasReachedEnd, String? nextCursor
});




}
/// @nodoc
class _$MyUploadStateCopyWithImpl<$Res>
    implements $MyUploadStateCopyWith<$Res> {
  _$MyUploadStateCopyWithImpl(this._self, this._then);

  final MyUploadState _self;
  final $Res Function(MyUploadState) _then;

/// Create a copy of MyUploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notes = null,Object? selectedStatus = freezed,Object? isLoading = null,Object? error = freezed,Object? isRefreshing = null,Object? hasReachedEnd = null,Object? nextCursor = freezed,}) {
  return _then(_self.copyWith(
notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as List<UploadedNoteSummary>,selectedStatus: freezed == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as NoteOwnerStatus?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,hasReachedEnd: null == hasReachedEnd ? _self.hasReachedEnd : hasReachedEnd // ignore: cast_nullable_to_non_nullable
as bool,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MyUploadState].
extension MyUploadStatePatterns on MyUploadState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyUploadState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyUploadState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyUploadState value)  $default,){
final _that = this;
switch (_that) {
case _MyUploadState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyUploadState value)?  $default,){
final _that = this;
switch (_that) {
case _MyUploadState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UploadedNoteSummary> notes,  NoteOwnerStatus? selectedStatus,  bool isLoading,  String? error,  bool isRefreshing,  bool hasReachedEnd,  String? nextCursor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyUploadState() when $default != null:
return $default(_that.notes,_that.selectedStatus,_that.isLoading,_that.error,_that.isRefreshing,_that.hasReachedEnd,_that.nextCursor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UploadedNoteSummary> notes,  NoteOwnerStatus? selectedStatus,  bool isLoading,  String? error,  bool isRefreshing,  bool hasReachedEnd,  String? nextCursor)  $default,) {final _that = this;
switch (_that) {
case _MyUploadState():
return $default(_that.notes,_that.selectedStatus,_that.isLoading,_that.error,_that.isRefreshing,_that.hasReachedEnd,_that.nextCursor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UploadedNoteSummary> notes,  NoteOwnerStatus? selectedStatus,  bool isLoading,  String? error,  bool isRefreshing,  bool hasReachedEnd,  String? nextCursor)?  $default,) {final _that = this;
switch (_that) {
case _MyUploadState() when $default != null:
return $default(_that.notes,_that.selectedStatus,_that.isLoading,_that.error,_that.isRefreshing,_that.hasReachedEnd,_that.nextCursor);case _:
  return null;

}
}

}

/// @nodoc


class _MyUploadState implements MyUploadState {
  const _MyUploadState({final  List<UploadedNoteSummary> notes = const [], this.selectedStatus, this.isLoading = false, this.error, this.isRefreshing = false, this.hasReachedEnd = false, this.nextCursor}): _notes = notes;
  

 final  List<UploadedNoteSummary> _notes;
@override@JsonKey() List<UploadedNoteSummary> get notes {
  if (_notes is EqualUnmodifiableListView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notes);
}

@override final  NoteOwnerStatus? selectedStatus;
@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override@JsonKey() final  bool isRefreshing;
@override@JsonKey() final  bool hasReachedEnd;
@override final  String? nextCursor;

/// Create a copy of MyUploadState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyUploadStateCopyWith<_MyUploadState> get copyWith => __$MyUploadStateCopyWithImpl<_MyUploadState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyUploadState&&const DeepCollectionEquality().equals(other._notes, _notes)&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.hasReachedEnd, hasReachedEnd) || other.hasReachedEnd == hasReachedEnd)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notes),selectedStatus,isLoading,error,isRefreshing,hasReachedEnd,nextCursor);

@override
String toString() {
  return 'MyUploadState(notes: $notes, selectedStatus: $selectedStatus, isLoading: $isLoading, error: $error, isRefreshing: $isRefreshing, hasReachedEnd: $hasReachedEnd, nextCursor: $nextCursor)';
}


}

/// @nodoc
abstract mixin class _$MyUploadStateCopyWith<$Res> implements $MyUploadStateCopyWith<$Res> {
  factory _$MyUploadStateCopyWith(_MyUploadState value, $Res Function(_MyUploadState) _then) = __$MyUploadStateCopyWithImpl;
@override @useResult
$Res call({
 List<UploadedNoteSummary> notes, NoteOwnerStatus? selectedStatus, bool isLoading, String? error, bool isRefreshing, bool hasReachedEnd, String? nextCursor
});




}
/// @nodoc
class __$MyUploadStateCopyWithImpl<$Res>
    implements _$MyUploadStateCopyWith<$Res> {
  __$MyUploadStateCopyWithImpl(this._self, this._then);

  final _MyUploadState _self;
  final $Res Function(_MyUploadState) _then;

/// Create a copy of MyUploadState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notes = null,Object? selectedStatus = freezed,Object? isLoading = null,Object? error = freezed,Object? isRefreshing = null,Object? hasReachedEnd = null,Object? nextCursor = freezed,}) {
  return _then(_MyUploadState(
notes: null == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as List<UploadedNoteSummary>,selectedStatus: freezed == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as NoteOwnerStatus?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,hasReachedEnd: null == hasReachedEnd ? _self.hasReachedEnd : hasReachedEnd // ignore: cast_nullable_to_non_nullable
as bool,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
