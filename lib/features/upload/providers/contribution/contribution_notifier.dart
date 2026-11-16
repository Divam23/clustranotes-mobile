import 'package:clustranotes_mobile/core/errors/app_failure.dart';
import 'package:clustranotes_mobile/core/errors/app_failure_mapper.dart';
import 'package:clustranotes_mobile/core/errors/exceptions/app_exception.dart';
import 'package:clustranotes_mobile/features/upload/data/models/note_list_filter.dart';
import 'package:clustranotes_mobile/features/upload/data/models/note_owner_status_mapper.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_owner_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/upload_loading_action.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/pagination_params.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_notes_list_response_model.dart';
import 'package:clustranotes_mobile/features/upload/domain/repositories/upload_repository.dart';
import 'package:clustranotes_mobile/features/upload/providers/contribution/contribution_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';

class ContributionNotifier extends StateNotifier<ContributionState> {
  final UploadRepository _uploadRepository;
  ContributionNotifier(this._uploadRepository)
    : super(const ContributionState());


  void changeFilter(NoteOwnerStatus? ownerStatus){
      final selectedStatus = ownerStatus == state.selectedStatus
          ? null
          : ownerStatus;
      state = state.copyWith(selectedStatus: selectedStatus);
  }
  
  NoteListFilters get filters{
    final selectedStatus = state.selectedStatus;
    if(selectedStatus == null) {
      return const NoteListFilters(
          notePublishStatus: null,
          noteVerificationStatus: null
      );
    }
    return NoteOwnerStatusMapper.noteListFilterMapper(selectedStatus);
  }
  
  
  Future<UploadedNotesListResponseModel> getUserUploadedNotes(
    NoteListFilters? filters,
    PaginationParams pagination,
    CancelToken? cancelToken,
  ) async {
    try {
      final response = await _uploadRepository.getUserUploadedNotes(
        filter: filters,
        pagination: pagination,
        cancelToken: cancelToken,
      );
      return response;
    } on AppException catch (exception) {
      throw AppFailureMapper.map(exception);
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      debugPrint('Error fetching uploaded notes: $error');

      throw const AppFailure(
        message: 'Something went wrong. Please try again.',
        retryable: true,
      );
    } finally {
      if (mounted) {
        state = state.copyWith(
          isLoading: false,
          isLoadingMore: false,
          uploadLoadingActionStatus: null,
        );
      }
    }
  }

  Future<void> getNoteStatusStats() async {
    if (!mounted ||
        (state.isLoading && state.loadingAction == UploadLoadingAction.stats)) {
      return;
    }

    try {
      state = state.copyWith(
        isLoading: true,
        loadingAction: UploadLoadingAction.stats,
        error: null,
      );
      final statsData = await _uploadRepository.getNoteStatusStats();
      if (!mounted) return;
      state = state.copyWith(noteStatusStats: statsData);
    } on AppException catch (exception) {
      if (!mounted) return;
      state = state.copyWith(error: AppFailureMapper.map(exception));
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      if (!mounted) return;
      state = state.copyWith(
        error: const AppFailure(
          message: 'Something went wrong. Please try again.',
          retryable: true,
        ),
      );
    } finally {
      if (mounted) state = state.copyWith(isLoading: false);
    }
  }
}
